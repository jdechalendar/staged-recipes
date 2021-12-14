#!/usr/bin/bash
if [ -n "${OSX_ARCH}" ];
then
  PLATFORM=osx
else
  PLATFORM=linux
fi

ls -1 "${PREFIX}/lib/*uart*"

test -f "${PREFIX}/lib/libQuartic_${PLATFORM}_static.a"
test -f "${PREFIX}/include/Quartic/PolynomialRoots.hh"
${CXX} ${CXXFLAGS} \
  -L"${PREFIX}/lib" \
  -I "${PREFIX}/include/Quartic" \
  "${RECIPE_DIR}/test_linkage.cpp" \
  -o test_linkage \
  -Wall \
  -Wextra \
  -Werror \
  -lQuartic_${PLATFORM}_static
./test_linkage
