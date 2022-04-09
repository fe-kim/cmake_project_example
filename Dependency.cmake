
# ExternalProject 관련 명령어 셋 추가
# ExternalProject 기능을 사용하기 위함.
# 아래에서 ExternalProject_Add 사용함
include(ExternalProject)

# Dependency 관련 변수 설정
# PROJECT_BINARY_DIR는 미리 지정되어 있는 값. build 디렉토리를 말함.
set(DEP_INSTALL_DIR ${PROJECT_BINARY_DIR}/install)
set(DEP_INCLUDE_DIR ${DEP_INSTALL_DIR}/include)
set(DEP_LIB_DIR ${DEP_INSTALL_DIR}/lib)

ExternalProject_Add(
    dep-spdlog # 이 프로젝트를 빌드할 때 사용하게 될 대표 이름
    GIT_REPOSITORY "https://github.com/gabime/spdlog.git"
    GIT_TAG "v1.x"
    GIT_SHALLOW 1
    UPDATE_COMMAND ""
    PATCH_COMMAND ""
    # cmake configure를 할 때 어떤 옵션을 줄지 ..
    # 빌드하고 어디에 인스톨할 지 경로 지정.
    CMAKE_ARGS -DCMAKE_INSTALL_PREFIX=${DEP_INSTALL_DIR}
    TEST_COMMAND ""
)

# Dependency 리스트 및 라이브러리 파일 리스트 추가
set(DEP_LIST ${DEP_LIST} dep-spdlog)
#set(DEP_LIBS ${DEP_LIBS} libspdlog$<$<CONFIG:Debug>:d>)
set(DEP_LIBS ${DEP_LIBS} spdlog)

