// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ProjectRegistry {
    struct Project {
        string name;
        string techUsed;
        uint256 fundsRequired;
        string socialDocumentIPFSHash;
        string environmentalDocumentIPFSHash;
        string financeDocumentIPFSHash;
        string governanceDocumentIPFSHash;
        string goals;
        string impact;
        uint256 budget;
        uint256 tokensToIssue;
    }

    mapping(uint256 => Project) public projects;
    uint256 public projectCount;

    event ProjectRegistered(
        uint256 projectId,
        string name,
        string techUsed,
        uint256 fundsRequired,
        string socialDocumentIPFSHash,
        string environmentalDocumentIPFSHash,
        string financeDocumentIPFSHash,
        string governanceDocumentIPFSHash,
        string goals,
        string impact,
        uint256 budget,
        uint256 tokensToIssue
    );

    function registerProject(
        string memory _name,
        string memory _techUsed,
        uint256 _fundsRequired,
        string memory _socialDocumentIPFSHash,
        string memory _environmentalDocumentIPFSHash,
        string memory _financeDocumentIPFSHash,
        string memory _governanceDocumentIPFSHash,
        string memory _goals,
        string memory _impact,
        uint256 _budget,
        uint256 _tokensToIssue
    ) public {
        require(bytes(_name).length > 0, "Project name cannot be empty");
        require(bytes(_techUsed).length > 0, "Technology used cannot be empty");
        require(_fundsRequired > 0, "Funds required must be greater than 0");

        projectCount++;

        projects[projectCount] = Project(
            _name,
            _techUsed,
            _fundsRequired,
            _socialDocumentIPFSHash,
            _environmentalDocumentIPFSHash,
            _financeDocumentIPFSHash,
            _governanceDocumentIPFSHash,
            _goals,
            _impact,
            _budget,
            _tokensToIssue
        );

        emit ProjectRegistered(
            projectCount,
            _name,
            _techUsed,
            _fundsRequired,
            _socialDocumentIPFSHash,
            _environmentalDocumentIPFSHash,
            _financeDocumentIPFSHash,
            _governanceDocumentIPFSHash,
            _goals,
            _impact,
            _budget,
            _tokensToIssue
        );
    }

    function getProjectDetails(uint256 projectId)
        public
        view
        returns (
            string memory,
            string memory,
            uint256,
            string memory,
            string memory,
            string memory,
            string memory,
            string memory,
            string memory,
            uint256,
            uint256
        )
    {
        require(projectId > 0 && projectId <= projectCount, "Invalid project ID");

        Project storage project = projects[projectId];
        return (
            project.name,
            project.techUsed,
            project.fundsRequired,
            project.socialDocumentIPFSHash,
            project.environmentalDocumentIPFSHash,
            project.financeDocumentIPFSHash,
            project.governanceDocumentIPFSHash,
            project.goals,
            project.impact,
            project.budget,
            project.tokensToIssue
        );
    }

    function updateProjectDetails(
        uint256 projectId,
        string memory _name,
        string memory _techUsed,
        uint256 _fundsRequired,
        string memory _socialDocumentIPFSHash,
        string memory _environmentalDocumentIPFSHash,
        string memory _financeDocumentIPFSHash,
        string memory _governanceDocumentIPFSHash,
        string memory _goals,
        string memory _impact,
        uint256 _budget,
        uint256 _tokensToIssue
    ) public {
        require(projectId > 0 && projectId <= projectCount, "Invalid project ID");
        require(bytes(_name).length > 0, "Project name cannot be empty");
        require(bytes(_techUsed).length > 0, "Technology used cannot be empty");
        require(_fundsRequired > 0, "Funds required must be greater than 0");

        projects[projectId] = Project(
            _name,
            _techUsed,
            _fundsRequired,
            _socialDocumentIPFSHash,
            _environmentalDocumentIPFSHash,
            _financeDocumentIPFSHash,
            _governanceDocumentIPFSHash,
            _goals,
            _impact,
            _budget,
            _tokensToIssue
        );
    }
}
