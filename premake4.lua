solution "Decoda"
    configurations { "Debug", "Release" }
	platforms { "x32", "x64" }
    location "build"
	--debugdir "working"
	flags { "No64BitChecks" }
    
	defines { "_CRT_SECURE_NO_WARNINGS", "WIN32" }
    
    vpaths { 
        ["Header Files"] = { "**.h" },
        ["Source Files"] = { "**.cpp" },
		["Resource Files"] = { "**.rc" },
    }
	
	configuration "x32"
		defines { "_X86_" }
	
	configuration "x64"
		defines { "_X64_" }

project "Frontend"
    kind "WindowedApp"
	targetname "Decoda"
	flags { "WinMain" }
    location "build"
    language "C++"
    files {
		"src/Frontend/*.h",
		"src/Frontend/*.cpp",
		"src/Frontend/*.rc",
	}		
    includedirs {
		"src/Shared",
		"libs/wxWidgets/include",
		"libs/wxScintilla/include",
	}
	libdirs {
		"libs/Update/lib",
	}
    links {
		"comctl32",
		"rpcrt4",
		"imagehlp",
		"Shared",		
	}

    configuration "Debug"
        defines { "DEBUG" }
        flags { "Symbols" }
		links {
			"wxbase28d",
			"wxmsw28d_core",
			"wxmsw28d_aui",
			"wxscintillad",
			"wxbase28d_xml",
			"wxexpatd",
			"wxmsw28d_adv",
			"wxmsw28d_qa",
			"wxzlibd",
			"wxmsw28d_richtext",
			"wxmsw28d_html",
			"wxpngd",
		}

    configuration "Release"
        defines { "NDEBUG" }
        flags { "Optimize" }
		links {
			"wxbase28",
			"wxmsw28_core",
			"wxmsw28_aui",
			"wxscintilla",
			"wxbase28_xml",
			"wxexpat",
			"wxmsw28_adv",
			"wxmsw28_qa",
			"wxzlib",
			"wxmsw28_richtext",
			"wxmsw28_html",
			"wxpng",
		}
		
	configuration { "x32" }
		libdirs {
			"libs/wxWidgets/lib/vc_lib/Win32",
			"libs/wxScintilla/lib/Win32"
		}
		includedirs { "libs/Update/include" }
		links { "Update" }
		
	configuration { "x64" }
		libdirs {
			"libs/wxWidgets/lib/vc_lib/x64",
			"libs/wxScintilla/lib/x64"
		}

	configuration { "Debug", "x32" }
		targetdir "bin/debug"
		includedirs { "libs/wxWidgets/lib/vc_lib/Win32/mswd" }
		
	configuration { "Release", "x32" }
		targetdir "bin/release"
		includedirs { "libs/wxWidgets/lib/vc_lib/Win32/msw" }		
		
	configuration { "Debug", "x64" }
		targetdir "bin/debug64"
		includedirs { "libs/wxWidgets/lib/vc_lib/x64/mswd" }
		
	configuration { "Release", "x64" }
		targetdir "bin/release64"
		includedirs { "libs/wxWidgets/lib/vc_lib/x64/msw" }
		
project "LuaInject"
    kind "SharedLib"
    location "build"
    language "C++"
	defines { "TIXML_USE_STL" }
    files {
		"src/LuaInject/*.h",
		"src/LuaInject/*.cpp",
	}		
    includedirs {
		"src/Shared",
		"libs/LuaPlus/include",
		"libs/tinyxml/include",
		"libs/dbghlp/include",
	}
	libdirs {
		"libs/tinyxml/lib",
		"libs/dbghlp/lib",
	}
    links {
		"Shared",
		"psapi"
	}

    configuration "Debug"
        defines { "DEBUG" }
        flags { "Symbols" }
        

    configuration "Release"
        defines { "NDEBUG" }
        flags { "Optimize" }       
		
	configuration { "Debug", "x32" }
		targetdir "bin/debug"
		links { "tinyxmld_STL" }
		
	configuration { "Release", "x32" }
		targetdir "bin/release"
		links { "tinyxml_STL" }
		
	configuration { "Debug", "x64" }
		targetdir "bin/debug64"
		links { "tinyxml64d_STL" }
		
	configuration { "Release", "x64" }
		targetdir "bin/release64"
		links { "tinyxml64_STL" }
		
project "Shared"
    kind "StaticLib"
    location "build"
    language "C++"
    files {
		"src/Shared/*.h",
		"src/Shared/*.cpp",
	}		
    includedirs {
	}
	libdirs {
	}
    links {
	}

    configuration "Debug"
        defines { "DEBUG" }
        flags { "Symbols" }

    configuration "Release"
        defines { "NDEBUG" }
        flags { "Optimize" }
		
	configuration { "Debug", "x32" }
		targetdir "bin/debug"
		
	configuration { "Release", "x32" }
		targetdir "bin/release"
		
	configuration { "Debug", "x64" }
		targetdir "bin/debug64"
		
	configuration { "Release", "x64" }
		targetdir "bin/release64"