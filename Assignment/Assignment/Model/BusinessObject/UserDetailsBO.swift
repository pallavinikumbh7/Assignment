//
//  UserDetailsBO.swift
//  Assignment
//
//  Created by Pallavi on 04/08/20.
//  Copyright © 2020 Pallavi. All rights reserved.
//

import Foundation

class UserDetailsBO: Codable {

    let archiveUrl: String?
    let archived: Bool?
    let assigneesUrl: String?
    let blobsUrl: String?
    let branchesUrl: String?
    let cloneUrl: String?
    let collaboratorsUrl: String?
    let commentsUrl: String?
    let commitsUrl: String?
    let compareUrl: String?
    let contentsUrl: String?
    let contributorsUrl: String?
    let createdAt: String?
    let defaultBranch: String?
    let deploymentsUrl: String?
    let descriptionField: String?
    let disabled: Bool?
    let downloadsUrl: String?
    let eventsUrl: String?
    let fork: Bool?
    let forks: Int?
    let forksCount: Int?
    let forksUrl: String?
    let fullName: String?
    let gitCommitsUrl: String?
    let gitRefsUrl: String?
    let gitTagsUrl: String?
    let gitUrl: String?
    let hasDownloads: Bool?
    let hasIssues: Bool?
    let hasPages: Bool?
    let hasProjects: Bool?
    let hasWiki: Bool?
    let homepage: String?
    let hooksUrl: String?
    let htmlUrl: String?
    let id: Int?
    let issueCommentUrl: String?
    let issueEventsUrl: String?
    let issuesUrl: String?
    let keysUrl: String?
    let labelsUrl: String?
    let language: String?
    let languagesUrl: String?
    let license: License?
    let mergesUrl: String?
    let milestonesUrl: String?
    let mirrorUrl: String?
    let name: String?
    let nodeId: String?
    let notificationsUrl: String?
    let openIssues: Int?
    let openIssuesCount: Int?
    let owner: Owner?
    let privateField: Bool?
    let pullsUrl: String?
    let pushedAt: String?
    let releasesUrl: String?
    let size: Int?
    let sshUrl: String?
    let stargazersCount: Int?
    let stargazersUrl: String?
    let statusesUrl: String?
    let subscribersUrl: String?
    let subscriptionUrl: String?
    let svnUrl: String?
    let tagsUrl: String?
    let teamsUrl: String?
    let treesUrl: String?
    let updatedAt: String?
    let url: String?
    let watchers: Int?
    let watchersCount: Int?

    enum CodingKeys: String, CodingKey {
        case archiveUrl = "archive_url"
        case assigneesUrl = "assignees_url"
        case blobsUrl = "blobs_url"
        case branchesUrl = "branches_url"
        case cloneUrl = "clone_url"
        case collaboratorsUrl = "collaborators_url"
        case commentsUrl = "comments_url"
        case commitsUrl = "commits_url"
        case compareUrl = "compare_url"
        case contentsUrl = "contents_url"
        case contributorsUrl = "contributors_url"
        case createdAt = "created_at"
        case defaultBranch = "default_branch"
        case deploymentsUrl = "deployments_url"
        case descriptionField = "description"
        case downloadsUrl = "downloads_url"
        case eventsUrl = "events_url"
        case forksCount = "forks_count"
        case forksUrl = "forks_url"
        case fullName = "full_name"
        case gitCommitsUrl = "git_commits_url"
        case gitRefsUrl = "git_refs_url"
        case gitTagsUrl = "git_tags_url"
        case gitUrl = "git_url"
        case hasDownloads = "has_downloads"
        case hasIssues = "has_issues"
        case hasPages = "has_pages"
        case hasProjects = "has_projects"
        case hasWiki = "has_wiki"
        case hooksUrl = "hooks_url"
        case htmlUrl = "html_url"
        case issueCommentUrl = "issue_comment_url"
        case issueEventsUrl = "issue_events_url"
        case issuesUrl = "issues_url"
        case keysUrl = "keys_url"
        case labelsUrl = "labels_url"
        case languagesUrl = "languages_url"
        case mergesUrl = "merges_url"
        case milestonesUrl = "milestones_url"
        case mirrorUrl = "mirror_url"
        case nodeId = "node_id"
        case notificationsUrl = "notifications_url"
        case openIssues = "open_issues"
        case openIssuesCount = "open_issues_count"
        case privateField = "private"
        case pullsUrl = "pulls_url"
        case pushedAt = "pushed_at"
        case releasesUrl = "releases_url"
        case sshUrl = "ssh_url"
        case stargazersCount = "stargazers_count"
        case stargazersUrl = "stargazers_url"
        case statusesUrl = "statuses_url"
        case subscribersUrl = "subscribers_url"
        case subscriptionUrl = "subscription_url"
        case svnUrl = "svn_url"
        case tagsUrl = "tags_url"
        case teamsUrl = "teams_url"
        case treesUrl = "trees_url"
        case updatedAt = "updated_at"
        case watchersCount = "watchers_count"
        case url, owner, name, language, homepage, fork, archived, disabled, forks, size, license, id, watchers
        
    }
    required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        archiveUrl = try values.decodeIfPresent(String.self, forKey: .archiveUrl)
        archived = try values.decodeIfPresent(Bool.self, forKey: .archived)
        assigneesUrl = try values.decodeIfPresent(String.self, forKey: .assigneesUrl)
        blobsUrl = try values.decodeIfPresent(String.self, forKey: .blobsUrl)
        branchesUrl = try values.decodeIfPresent(String.self, forKey: .branchesUrl)
        cloneUrl = try values.decodeIfPresent(String.self, forKey: .cloneUrl)
        collaboratorsUrl = try values.decodeIfPresent(String.self, forKey: .collaboratorsUrl)
        commentsUrl = try values.decodeIfPresent(String.self, forKey: .commentsUrl)
        commitsUrl = try values.decodeIfPresent(String.self, forKey: .commitsUrl)
        compareUrl = try values.decodeIfPresent(String.self, forKey: .compareUrl)
        contentsUrl = try values.decodeIfPresent(String.self, forKey: .contentsUrl)
        contributorsUrl = try values.decodeIfPresent(String.self, forKey: .contributorsUrl)
        createdAt = try values.decodeIfPresent(String.self, forKey: .createdAt)
        defaultBranch = try values.decodeIfPresent(String.self, forKey: .defaultBranch)
        deploymentsUrl = try values.decodeIfPresent(String.self, forKey: .deploymentsUrl)
        descriptionField = try values.decodeIfPresent(String.self, forKey: .descriptionField)
        disabled = try values.decodeIfPresent(Bool.self, forKey: .disabled)
        downloadsUrl = try values.decodeIfPresent(String.self, forKey: .downloadsUrl)
        eventsUrl = try values.decodeIfPresent(String.self, forKey: .eventsUrl)
        fork = try values.decodeIfPresent(Bool.self, forKey: .fork)
        forks = try values.decodeIfPresent(Int.self, forKey: .forks)
        forksCount = try values.decodeIfPresent(Int.self, forKey: .forksCount)
        forksUrl = try values.decodeIfPresent(String.self, forKey: .forksUrl)
        fullName = try values.decodeIfPresent(String.self, forKey: .fullName)
        gitCommitsUrl = try values.decodeIfPresent(String.self, forKey: .gitCommitsUrl)
        gitRefsUrl = try values.decodeIfPresent(String.self, forKey: .gitRefsUrl)
        gitTagsUrl = try values.decodeIfPresent(String.self, forKey: .gitTagsUrl)
        gitUrl = try values.decodeIfPresent(String.self, forKey: .gitUrl)
        hasDownloads = try values.decodeIfPresent(Bool.self, forKey: .hasDownloads)
        hasIssues = try values.decodeIfPresent(Bool.self, forKey: .hasIssues)
        hasPages = try values.decodeIfPresent(Bool.self, forKey: .hasPages)
        hasProjects = try values.decodeIfPresent(Bool.self, forKey: .hasProjects)
        hasWiki = try values.decodeIfPresent(Bool.self, forKey: .hasWiki)
        homepage = try values.decodeIfPresent(String.self, forKey: .homepage)
        hooksUrl = try values.decodeIfPresent(String.self, forKey: .hooksUrl)
        htmlUrl = try values.decodeIfPresent(String.self, forKey: .htmlUrl)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        issueCommentUrl = try values.decodeIfPresent(String.self, forKey: .issueCommentUrl)
        issueEventsUrl = try values.decodeIfPresent(String.self, forKey: .issueEventsUrl)
        issuesUrl = try values.decodeIfPresent(String.self, forKey: .issuesUrl)
        keysUrl = try values.decodeIfPresent(String.self, forKey: .keysUrl)
        labelsUrl = try values.decodeIfPresent(String.self, forKey: .labelsUrl)
        language = try values.decodeIfPresent(String.self, forKey: .language)
        languagesUrl = try values.decodeIfPresent(String.self, forKey: .languagesUrl)
        license = try values.decodeIfPresent(License.self, forKey: .license)
        mergesUrl = try values.decodeIfPresent(String.self, forKey: .mergesUrl)
        milestonesUrl = try values.decodeIfPresent(String.self, forKey: .milestonesUrl)
        mirrorUrl = try values.decodeIfPresent(String.self, forKey: .mirrorUrl)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        nodeId = try values.decodeIfPresent(String.self, forKey: .nodeId)
        notificationsUrl = try values.decodeIfPresent(String.self, forKey: .notificationsUrl)
        openIssues = try values.decodeIfPresent(Int.self, forKey: .openIssues)
        openIssuesCount = try values.decodeIfPresent(Int.self, forKey: .openIssuesCount)
        owner = try values.decodeIfPresent(Owner.self, forKey: .owner)
        privateField = try values.decodeIfPresent(Bool.self, forKey: .privateField)
        pullsUrl = try values.decodeIfPresent(String.self, forKey: .pullsUrl)
        pushedAt = try values.decodeIfPresent(String.self, forKey: .pushedAt)
        releasesUrl = try values.decodeIfPresent(String.self, forKey: .releasesUrl)
        size = try values.decodeIfPresent(Int.self, forKey: .size)
        sshUrl = try values.decodeIfPresent(String.self, forKey: .sshUrl)
        stargazersCount = try values.decodeIfPresent(Int.self, forKey: .stargazersCount)
        stargazersUrl = try values.decodeIfPresent(String.self, forKey: .stargazersUrl)
        statusesUrl = try values.decodeIfPresent(String.self, forKey: .statusesUrl)
        subscribersUrl = try values.decodeIfPresent(String.self, forKey: .subscribersUrl)
        subscriptionUrl = try values.decodeIfPresent(String.self, forKey: .subscriptionUrl)
        svnUrl = try values.decodeIfPresent(String.self, forKey: .svnUrl)
        tagsUrl = try values.decodeIfPresent(String.self, forKey: .tagsUrl)
        teamsUrl = try values.decodeIfPresent(String.self, forKey: .teamsUrl)
        treesUrl = try values.decodeIfPresent(String.self, forKey: .treesUrl)
        updatedAt = try values.decodeIfPresent(String.self, forKey: .updatedAt)
        url = try values.decodeIfPresent(String.self, forKey: .url)
        watchers = try values.decodeIfPresent(Int.self, forKey: .watchers)
        watchersCount = try values.decodeIfPresent(Int.self, forKey: .watchersCount)
    }
}

class Owner: Codable {

    let avatarUrl: String?
    let eventsUrl: String?
    let followersUrl: String?
    let followingUrl: String?
    let gistsUrl: String?
    let gravatarId: String?
    let htmlUrl: String?
    let id: Int?
    let login: String?
    let nodeId: String?
    let organizationsUrl: String?
    let receivedEventsUrl: String?
    let reposUrl: String?
    let siteAdmin: Bool?
    let starredUrl: String?
    let subscriptionsUrl: String?
    let type: String?
    let url: String?
    
    enum CodingKeys: String, CodingKey {
        case avatarUrl = "avatar_url"
        case eventsUrl = "events_url"
        case followersUrl = "followers_url"
        case followingUrl = "following_url"
        case gistsUrl = "gists_url"
        case gravatarId = "gravatar_id"
        case htmlUrl = "html_url"
        case nodeId = "node_id"
        case organizationsUrl = "organizations_url"
        case receivedEventsUrl = "received_events_url"
        case reposUrl = "repos_url"
        case siteAdmin = "site_admin"
        case starredUrl = "starred_url"
        case subscriptionsUrl = "subscriptions_url"
        case type, url, id, login
    }
    required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        avatarUrl = try values.decodeIfPresent(String.self, forKey: .avatarUrl)
        eventsUrl = try values.decodeIfPresent(String.self, forKey: .eventsUrl)
        followersUrl = try values.decodeIfPresent(String.self, forKey: .followersUrl)
        followingUrl = try values.decodeIfPresent(String.self, forKey: .followingUrl)
        gistsUrl = try values.decodeIfPresent(String.self, forKey: .gistsUrl)
        gravatarId = try values.decodeIfPresent(String.self, forKey: .gravatarId)
        htmlUrl = try values.decodeIfPresent(String.self, forKey: .htmlUrl)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        login = try values.decodeIfPresent(String.self, forKey: .login)
        nodeId = try values.decodeIfPresent(String.self, forKey: .nodeId)
        organizationsUrl = try values.decodeIfPresent(String.self, forKey: .organizationsUrl)
        receivedEventsUrl = try values.decodeIfPresent(String.self, forKey: .receivedEventsUrl)
        reposUrl = try values.decodeIfPresent(String.self, forKey: .reposUrl)
        siteAdmin = try values.decodeIfPresent(Bool.self, forKey: .siteAdmin)
        starredUrl = try values.decodeIfPresent(String.self, forKey: .starredUrl)
        subscriptionsUrl = try values.decodeIfPresent(String.self, forKey: .subscriptionsUrl)
        type = try values.decodeIfPresent(String.self, forKey: .type)
        url = try values.decodeIfPresent(String.self, forKey: .url)
    }
}

struct License: Codable {

    let key: String?
    let name: String?
    let nodeId: String?
    let spdxId: String?
    let url: String?


    enum CodingKeys: String, CodingKey {
        case key, name, url
        case nodeId = "node_id"
        case spdxId = "spdx_id"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        key = try values.decodeIfPresent(String.self, forKey: .key)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        nodeId = try values.decodeIfPresent(String.self, forKey: .nodeId)
        spdxId = try values.decodeIfPresent(String.self, forKey: .spdxId)
        url = try values.decodeIfPresent(String.self, forKey: .url)
    }
}
