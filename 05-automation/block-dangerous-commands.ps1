# block-dangerous-commands.ps1  (Windows)
# Chapter 12, "Hooks: Rules That Run Themselves"
#
# A PreToolUse hook. Claude Code sends the details of the command
# it is about to run on standard input. If the text contains a word
# from the list below, this script refuses (exit code 2) and tells
# Claude why. Otherwise it allows the command (exit code 0).
#
# It is a blunt word match. "git stash list" is harmless, but it will
# still be blocked. That is on purpose: when in doubt, ask the owner.
#
# Save as:  .claude\hooks\block-dangerous-commands.ps1  in your project.

$raw = [Console]::In.ReadToEnd()
$text = $raw.ToLower()

$blocked = @(
    'git stash',
    'git reset',
    'git clean',
    'git checkout',
    'git restore',
    'git push --force',
    'git push -f',
    'rm -rf',
    'rm -fr',
    'rm -r ',
    'remove-item',
    'rmdir /s',
    'del /s'
)

foreach ($word in $blocked) {
    if ($text.Contains($word)) {
        [Console]::Error.WriteLine(
            "Blocked by the owner's safety hook: the command contains '$word'. " +
            "Do not try another way to do the same thing. " +
            "Stop, explain why you need it, and ask the owner.")
        exit 2
    }
}

exit 0
