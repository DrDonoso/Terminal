function gitcheckoutbranch(){
    branch=$(git branch -l | fzf --height 30% --layout reverse | awk '{print $1}')
    git checkout $branch
}

function gitb(){
    git checkout -b $1
    git push --set-upstream origin $1
}

function gitcp(){
    git add .
    git commit -m $1
    git push
}