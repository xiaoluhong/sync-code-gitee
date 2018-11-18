#!/usr/bin/bash

export repo_list=(rancher rke ui docs os charts rancher-catalog community-catalog server-chart nstall-docker)
export github_repo_url=github.com/rancher
export gitee_repo_url=gitee.com/rancher

sync_repo ()
{
    for repo in $(repo_list);
    do
        git clone https://${github_repo_url}/${repo}.git
        cd ${repo}
        git push -f https://${GITEE_ACC}:${GITEE_PW}@${gitee_repo_url}/${repo}.git

    done

}

sync_repo


git clone https://github.com/xiaoluhong/k8s-website.git
cd k8s-website
touch $(date +%Y-%m-%d)
git add .
git commit -m "update"
git push -f https://${GITHUB_USERNAME}:${GITHUB_PASSWORD}@xiaoluhong/k8s-website.git