tell application "iTerm2"
    tell current window
        create tab with default profile
        tell current session of current tab
            write text "cd ~/Developer/pequity/backend && python manage.py runserver"
        end tell
    end tell
    
    tell current window
        create tab with default profile
        tell current session of current tab
            write text "cd ~/Developer/pequity/frontend && pnpm run dev"
        end tell
    end tell
    
    tell current window
        create tab with default profile
        tell current session of current tab
            write text "cd ~/Developer/pequity/frontendv2 && pnpm run dev"
        end tell
    end tell
end tell
