#
# The Core functionalities
#


# we expect the the executable exports a variable MSU_LIB whose
# value is the path to the library holding this and other modules


# mod vars
MSU_REQUIRE_LOCK= # lock to ensure we dont source an already-sourced file
MSU_EXTERNAL_LIB=${MSU_EXTERNAL_LIB:-${HOME}/.msu}


# check dependencies
function msu__check_deps() {
  for cmd in ${DEPS}
  do
    command -v ${cmd} > /dev/null 2>&1 || {
      echo "warning: \`${cmd}' not found"
    }
  done
}


# require a module
function msu_require() {
  echo ${MSU_REQUIRE_LOCK} | grep -E :${1}: > /dev/null || {
    local fullpath=$(echo ${1} | sed 's/\.*$//g' | sed 's/\./\//g')
    # internal modules have precedence
    source ${MSU_LIB}/${fullpath}.sh > /dev/null 2>&1 || {
      # external libs
      source ${MSU_EXTERNAL_LIB}/${fullpath}.sh > /dev/null 2>&1 || {
        echo "error: require: failed to load module '${1}'"
        exit 1
      }
    }
    msu__check_deps
    MSU_REQUIRE_LOCK=:${1}:${MSU_REQUIRE_LOCK}
  }
}


# run a single function
function msu_run() {
  local module=$(echo ${1} | grep -Eo ".*\.")
  local func=$(echo ${1} | grep -Eo "\.[^.]+$" | cut -b 2-)
  msu_require ${module}
  ${func} ${@:2}
}


# upgrade myself
function msu_upgrade() {
  LIB=$(dirname ${MSU_LIB})
  BIN=$(dirname $(which msu))
  wget -qO- http://git.io/vTE0s | LIB=${LIB} BIN=${BIN} bash
}


# install module(s)
function msu_install() {
  mkdir -p ${MSU_EXTERNAL_LIB}
  for dir in "$@"
  do
    cp -r ${dir} ${MSU_EXTERNAL_LIB} > /dev/null
    if [ $? ] ; then
      echo "installed: ${dir}"
    else
      echo "error: install: could not install ${dir}"
    fi
  done
}


# uninstall module(s)
function msu_uninstall() {
  for dir in "$@"
  do
    path=${MSU_EXTERNAL_LIB}/${dir}
    [ -e ${path} ] && {
      rm -rf ${path} > /dev/null
      if [ $? ] ; then
        echo "uninstalled: ${dir}"
      else
        echo "error: uninstall: could not uninstall ${dir}"
      fi
    } || {
      echo "not installed: ${dir}"
    }
  done
}
