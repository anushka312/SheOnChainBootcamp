// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/utils/Counters.sol";

contract NFTMarketplace is ERC721URIStorage {
    using Counters for Counters.Counter;
    address payable public immutable owner;

    Counters.Counter private _tokenIds;

    uint256 public listPrice = 0.01 ether;

    struct ListedToken {
        uint256 price;
        bool currentlyListed;
    }

    mapping(uint256 => ListedToken) private idToListedToken;

    event TokenListedSuccess(
        uint256 indexed tokenId,
        address indexed seller,
        uint256 price
    );

    event TokenSold(
        uint256 indexed tokenId,
        address indexed buyer,
        uint256 price
    );

    constructor() ERC721("NFTMarketplace", "NFTM") {
        owner = payable(msg.sender);
    }

    function updateListPrice(uint256 _listPrice) external {
        require(msg.sender == owner, "Only the owner can update the list price");
        listPrice = _listPrice;
    }

    function createToken(string calldata tokenURI, uint256 price) external payable returns (uint256) {
        require(price >= listPrice, "Price must be at least the listing price");
        require(msg.value == listPrice, "Incorrect listing price");

        uint256 newItemId = _tokenIds.current();
        _tokenIds.increment();
        _safeMint(msg.sender, newItemId);
        _setTokenURI(newItemId, tokenURI);

        idToListedToken[newItemId] = ListedToken({
            price: price,
            currentlyListed: true
        });

        _transfer(msg.sender, address(this), newItemId);
        emit TokenListedSuccess(newItemId, msg.sender, price);

        return newItemId;
    }

    function getNFTs(bool onlyMine) external view returns (ListedToken[] memory) {
        uint256 totalItemCount = _tokenIds.current();
        uint256 itemCount = 0;
        uint256 index = 0;

        for (uint256 i = 1; i <= totalItemCount; i++) {
            if (idToListedToken[i].currentlyListed && (!onlyMine || ownerOf(i) == msg.sender)) {
                itemCount++;
            }
        }

        ListedToken[] memory items = new ListedToken[](itemCount);

        for (uint256 i = 1; i <= totalItemCount; i++) {
            if (idToListedToken[i].currentlyListed && (!onlyMine || ownerOf(i) == msg.sender)) {
                items[index++] = idToListedToken[i];
            }
        }
        return items;
    }

    function executeSale(uint256 tokenId) external payable {
        ListedToken storage listedToken = idToListedToken[tokenId];
        uint256 price = listedToken.price;

        require(msg.value == price, "Incorrect price sent");
        require(listedToken.currentlyListed, "Token is not currently listed");

        listedToken.currentlyListed = false;

        _transfer(address(this), msg.sender, tokenId);
        payable(owner).transfer(listPrice);
        payable(ownerOf(tokenId)).transfer(price - listPrice);

        emit TokenSold(tokenId, msg.sender, price);
    }
}
