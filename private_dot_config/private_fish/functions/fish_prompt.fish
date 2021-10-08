function fish_prompt
  set -l common_last_command_status $status
  set -l cwd

  set cwd (prompt_pwd)

  set -l common_prompt_symbol "❯"

  # Colours
  set -l common_colors_host (set_color green)
  set -l common_colors_host_aws_vault (set_color yellow)
  set -l common_colors_current_dir (set_color blue)
  set -l common_colors_return_status_true (set_color magenta)
  set -l common_colors_return_status_false (set_color yellow)
  set -l common_colors_bg_jobs (set_color yellow)

  echo -n -s $common_colors_current_dir $cwd " "

  if test $common_last_command_status -eq 0
    echo -n -s $common_colors_return_status_true $common_prompt_symbol
  else
    echo -n -s $common_colors_return_status_false $common_prompt_symbol
  end

  echo -n -s " "
end

function common_is_git_repo -d "Check if the directory is a repository"
  test -d .git
  or begin
    set -l info (command git rev-parse --git-dir --is-bare-repository 2>/dev/null)
    and test $info[2] = false
  end
end

function common_is_git_staged -d "Check if repo has staged changes"
  common_is_git_repo
  and begin
    not command git diff --cached --no-ext-diff --quiet --exit-code
  end
end

function common_is_git_unstaged -d "Check if repo has any changes"
  common_is_git_repo
  and begin
    not command git diff-index --cached --quiet HEAD -- >/dev/null 2>&1
    or not command git diff --no-ext-diff --quiet --exit-code >/dev/null 2>&1
  end
end

function fish_right_prompt
  set -l common_colors_git_status_default (set_color green)
  set -l common_colors_git_status_staged (set_color red)
  set -l common_colors_git_status_unstaged (set_color yellow)
  set -l common_colors_git_prompt_sha (set_color green)

  set -l branch (git rev-parse --abbrev-ref HEAD 2>/dev/null)

  if common_is_git_repo
    if common_is_git_staged
      echo -n $common_colors_git_status_staged $branch
    else if common_is_git_unstaged
      echo -n $common_colors_git_status_unstaged $branch
    else
      echo -n $common_colors_git_status_default $branch
    end
  end

  echo -n " "
end