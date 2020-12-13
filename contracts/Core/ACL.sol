/*
This ACL Contract is about creating descriptive roles for various functions of our contracts.
We have four roles.


1) JobConfirmer          : fulfillJob()
2) BlockConfirmer        : confirmBlock()
3) StakeModifier         : setStakerStake(), giveBlockReward(), slash(), giveRewards()
4) StakerActivityUpdater  : setStakerEpochLastRevealed(), updateCommitmentEpoch()

On top of it we have Default Admin role, which can grant and revoke above roles.

Please go through this diagram to get better idea on it
https://github.com/........(need to be updated)tree/ACL/acl.png;

.*/

pragma solidity 0.6.11;
import "openzeppelin-solidity/contracts/access/AccessControl.sol";

contract JobConfirmer is AccessControl {

    bytes32 public constant JobConfirmerRole = keccak256("JobConfirmer");

    event JobConfirmerAdded(address indexed account);
    event JobConfirmerRemoved(address indexed account);

    constructor() internal {
        _setupRole(DEFAULT_ADMIN_ROLE, msg.sender);
    }

    modifier onlyJobConfirmer() {
        require(isJobConfirmer(msg.sender), "AccessControl: sender must be an JobConfirmer to call this function");
        _;
    }  
    function isJobConfirmer(address account) public view returns (bool) {
        return hasRole(JobConfirmerRole,account);
    }
    function grantJobConfirmer(address account) public {
        grantRole(JobConfirmerRole, account); // Restricted to Admin role
        emit JobConfirmerAdded(account);
    }
    function revokeJobConfirmer (address account) public  {
        revokeRole(JobConfirmerRole, account); // Restricted to Admin role
        emit JobConfirmerRemoved(account);
    }
}
contract BlockConfirmer is AccessControl {

    bytes32 public constant BlockConfirmerRole = keccak256("BlockConfirmer");

    event BlockConfirmerAdded(address indexed account);
    event BlockConfirmerRemoved(address indexed account);

    constructor() internal {
        _setupRole(DEFAULT_ADMIN_ROLE, msg.sender);
    }
    modifier onlyblockConfirmer() {
        require(isBlockConfirmer(msg.sender), "AccessControl: sender must be an BlockConfirmer to call this function");
        _;
    }
    function isBlockConfirmer(address account) public view returns (bool) {
        return hasRole(BlockConfirmerRole,account);
    }
    function grantBlockConfirmer(address account) public {
        grantRole(BlockConfirmerRole, account); // Restricted to Admin role
        emit BlockConfirmerAdded(account);
    }
    function revokeBlockConfirmer (address account) public {
        revokeRole(BlockConfirmerRole, account); // Restricted to Admin role
        emit BlockConfirmerRemoved(account);
    }
}
contract StakeModifier is AccessControl {

    bytes32 public constant StakeModifierRole = keccak256("StakeModifier");

    event StakeModifierAdded(address indexed account);
    event StakeModifierRemoved(address indexed account);

    constructor() internal {
        _setupRole(DEFAULT_ADMIN_ROLE, msg.sender);
    }
    modifier onlyStakeModifier() {
        require(isStakeModifier(msg.sender), "AccessControl: sender must be an StakeModifier to call this function");
        _;
    }

    function isStakeModifier(address account) public view returns (bool) {
        return hasRole(StakeModifierRole,account);
    }
    function grantStakeModifier(address account) public  {
        grantRole(StakeModifierRole, account); // Restricted to Admin role
        emit StakeModifierAdded(account);
    }
    function revokeStakeModifier (address account) public {
        revokeRole(StakeModifierRole, account); // Restricted to Admin role
        emit StakeModifierRemoved(account);
    }
}
contract StakerActivityUpdater is AccessControl {

    bytes32 public constant StakerActivityUpdaterRole = keccak256("StakerActivityUpdater");

    event StakerActivityUpdaterAdded(address indexed account);
    event StakerActivityUpdaterRemoved(address indexed account);

    constructor() internal {
        _setupRole(DEFAULT_ADMIN_ROLE, msg.sender);
    }

    modifier onlyStakerActivityUpdater() {
        require(isStakerActivityUpdater(msg.sender), "AccessControl: sender must be an StakerActivityUpdater to call this function");
        _;
    }
    function isStakerActivityUpdater(address account) public view returns (bool) {
        return hasRole(StakerActivityUpdaterRole,account);
    }
    function grantStakerActivityUpdater(address account) public  {
        grantRole(StakerActivityUpdaterRole, account); // Restricted to Admin role
        emit StakerActivityUpdaterAdded(account);
    }
    function revokeStakerActivityUpdater (address account) public  {
        revokeRole(StakerActivityUpdaterRole, account); // Restricted to Admin role
        emit StakerActivityUpdaterRemoved(account);
    }
}