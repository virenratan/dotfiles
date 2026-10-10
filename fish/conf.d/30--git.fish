# aliases.
abbr -a gpr 'git pull --rebase origin main'
abbr -a gca 'git commit --amend --no-edit'
abbr -a gpf 'git push --force-with-lease'
abbr -a push 'git push'
abbr -a gstash 'git stash -u'
abbr -a gunstash 'git stash pop'

function gpm
  set urls (git remote get-url --all mirror 2>/dev/null)
  echo "⚠️  This will mirror-push to 'mirror':"
  for u in $urls
    echo "   → $u"
  end
  echo "This will overwrite deletions/rewrites. Continue? (y/N)"
  read -l confirm
  if test "$confirm" = "y" -o "$confirm" = "Y"
    if git push --mirror mirror
      echo "✅ Mirror push completed successfully."
    else
      echo "❌ Mirror push failed."
    end
  else
    echo "Aborted."
  end
end
