# Ensure directory history navigation commands are properly defined
# Fix for "Unknown command: nextd" errors

# Only define these if they don't already exist
if not functions -q nextd
    function nextd --description 'Move forward in directory history'
        # Default implementation similar to fish's built-in
        builtin history --directory forward $argv
    end
end

if not functions -q prevd
    function prevd --description 'Move backward in directory history'
        # Default implementation similar to fish's built-in
        builtin history --directory backward $argv
    end
end

# Also ensure the commonly used aliases are defined
if not functions -q next
    function next --description 'Move forward in directory history'
        nextd $argv
    end
end

if not functions -q prev
    function prev --description 'Move backward in directory history'
        prevd $argv
    end
end
