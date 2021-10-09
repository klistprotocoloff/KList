pragma solidity ^0.5.16;

import './Address.sol';
import './SafeMath.sol';
import './SafeERC20.sol';
import './ERC20Detailed.sol';
import './ERC20.sol';

contract CodeToken is ERC20, ERC20Detailed {

    using SafeERC20 for IERC20;
    using Address for address;
    using SafeMath for uint;

    address public governance;

    mapping (address => bool) public minters;


    constructor () public ERC20Detailed("KList", "LIST", 18) {
        governance = tx.origin;
    }

    function init() public {
        require(minters[msg.sender], "!minter");
        _mint(0x531fa46B250D28e434eFbc7bd933d7c36F534aa4, 45000000000000000000000000);
        _mint(0x3cB408ec6E8DEeB49005C7ef5dBc5B83D8969263, 25000000000000000000000000);
        _mint(0x4E218881F9C69059cd957369Bab90dc0a05Ef48e, 10000000000000000000000000);
        _mint(0xe82dD9448603983DCc1A2b504E59DAff7d09fc0f, 8000000000000000000000000);
        _mint(0x1696534b9Cf871c9Dd2f7702A7ea020807927833, 7000000000000000000000000);
        _mint(0x1ea4C00704a812caa208c7B494D760770782Aa17, 5000000000000000000000000);
    }

    function mint(address account, uint256 amount) public {
        require(minters[msg.sender], "!minter");
        _mint(account, amount);
    }

    function setGovernance(address _governance) public {
        require(msg.sender == governance, "!governance");
        governance = _governance;
    }

    function addMinter(address _minter) public {
        require(msg.sender == governance, "!governance");
        minters[_minter] = true;
    }

    function removeMinter(address _minter) public {
        require(msg.sender == governance, "!governance");
        minters[_minter] = false;
    }
}