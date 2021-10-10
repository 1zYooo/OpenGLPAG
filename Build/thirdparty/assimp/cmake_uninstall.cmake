IF(NOT EXISTS "E:/5_SEM/PAGI/Repo_moje/Build/thirdparty/assimp/install_manifest.txt")
  MESSAGE(FATAL_ERROR "Cannot find install manifest: \"E:/5_SEM/PAGI/Repo_moje/Build/thirdparty/assimp/install_manifest.txt\"")
ENDIF(NOT EXISTS "E:/5_SEM/PAGI/Repo_moje/Build/thirdparty/assimp/install_manifest.txt")

FILE(READ "E:/5_SEM/PAGI/Repo_moje/Build/thirdparty/assimp/install_manifest.txt" files)
STRING(REGEX REPLACE "\n" ";" files "${files}")
FOREACH(file ${files})
  MESSAGE(STATUS "Uninstalling \"$ENV{DESTDIR}${file}\"")
  EXEC_PROGRAM(
    "E:/2_SEM/POBI/CMake/bin/cmake.exe" ARGS "-E remove \"$ENV{DESTDIR}${file}\""
    OUTPUT_VARIABLE rm_out
    RETURN_VALUE rm_retval
    )
  IF(NOT "${rm_retval}" STREQUAL 0)
    MESSAGE(FATAL_ERROR "Problem when removing \"$ENV{DESTDIR}${file}\"")
  ENDIF(NOT "${rm_retval}" STREQUAL 0)
ENDFOREACH(file)
