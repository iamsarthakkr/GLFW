project "GLFW"
    kind "StaticLib"
    language "C"
    staticruntime "on"

    -- Output directories for binaries and intermediate files
    targetdir ("bin/%{cfg.buildcfg}/%{prj.name}")
    objdir ("bin-int/%{cfg.buildcfg}/%{prj.name}")

    -- Common files for all platforms
    files {
        "include/GLFW/glfw3.h",
        "include/GLFW/glfw3native.h",
        "src/glfw_config.h",
        "src/context.c",
        "src/init.c",
        "src/input.c",
        "src/monitor.c",
        "src/vulkan.c",
        "src/window.c",
        "src/egl_context.c",
        "src/internal.h",
        "src/platform.h",
        "src/platform.c",
        "src/mapping.h",
        "src/null_init.c",
        "src/null_window.c",
        "src/null_joystick.c",
        "src/null_monitor.c",
        "src/null_platform.h",
    }   
    

    -- macOS-specific configuration
    filter "system:macosx"
        systemversion "15.0" -- Set the deployment target to macOS 15.0
        files {
            "src/cocoa_init.m",
            "src/cocoa_joystick.m",
            "src/cocoa_monitor.m",
            "src/cocoa_window.m",
            "src/cocoa_time.c",
            "src/nsgl_context.m",
            "src/posix_time.c",
            "src/posix_thread.c",
            "src/osmesa_context.c",
            "src/posix_module.c"
        }
        defines { "_GLFW_COCOA" }

    -- Debug configuration
    filter "configurations:Debug"
        runtime "Debug"
        symbols "on"

    -- Release configuration
    filter "configurations:Release"
        runtime "Release"
        optimize "on"