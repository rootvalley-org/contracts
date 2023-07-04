pragma solidity >=0.4.22 <0.9.0;

contract Stichting {

    struct Bestuurder {
        address bestuurderAddress;
        bool isBenoemd;
        uint256 benoemdTot;
    }

    mapping(address => Bestuurder) public bestuurders;

    function benoem(address _bestuurder, uint256 _termijn) public {
        Bestuurder memory newBestuurder;
        newBestuurder.bestuurderAddress = _bestuurder;
        newBestuurder.isBenoemd = true;
        newBestuurder.benoemdTot = block.timestamp + _termijn;
        bestuurders[_bestuurder] = newBestuurder;
    }

    function eindeLidmaatschap(address _bestuurder) public {
        Bestuurder memory bestuurder = bestuurders[_bestuurder];
        if (block.timestamp > bestuurder.benoemdTot) {
            bestuurder.isBenoemd = false;
        }
    }

    function statutenWijziging() public pure returns (string memory) {
        return "Statuten kunnen worden gewijzigd volgens de gestelde regels in het statuut.";
    }

    function ontbindingEnVereffening() public pure returns (string memory) {
        return "De stichting kan worden ontbonden en de bezittingen worden vereffend volgens de gestelde regels in het statuut.";
    }
}
