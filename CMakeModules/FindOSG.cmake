# This module defines

# OSG_LIBRARY
# OSG_FOUND, if false, do not try to link to osg
# OSG_INCLUDE_DIRS, where to find the headers
# OSG_INCLUDE_DIR, where to find the source headers
# OSG_GEN_INCLUDE_DIR, where to find the generated headers

# to use this module, set variables to point to the osg build
# directory, and source directory, respectively
# OSGDIR or OSG_SOURCE_DIR: osg source directory, typically OpenSceneGraph
# OSG_DIR or OSG_BUILD_DIR: osg build directory, place in which you've
#    built osg via cmake 

# Header files are presumed to be included like
# #include <osg/PositionAttitudeTransform>
# #include <osgUtil/SceneView>

###### headers ######

SET(OSG_DIR "" CACHE PATH "Set to base OpenSceneGraph install path")
FIND_PATH(OSG_INCLUDE_DIR osg/Node
        PATHS
        ${OSG_DIR}
        $ENV{OSG_SOURCE_DIR}
        $ENV{OSGDIR}
        $ENV{OSG_DIR}
        $ENV{OSG}
        $ENV{OSG}
        /usr/local/
        /usr/
        /sw/ # Fink
        /opt/local/ # DarwinPorts
        /opt/csw/ # Blastwave
        /opt/
        [HKEY_LOCAL_MACHINE\\SYSTEM\\CurrentControlSet\\Control\\Session\ Manager\\Environment;OSG_ROOT]/
        ~/Library/Frameworks
        /Library/Frameworks
        PATH_SUFFIXES
        /include
        )
IF(NOT OSG_INCLUDE_DIR)
    SET(OSG_INCLUDE_DIR ${OSG_DIR}/include)
ENDIF()
FIND_PATH(OSG_GEN_INCLUDE_DIR osg/Config
        PATHS
        ${OSG_DIR}
        $ENV{OSG_SOURCE_DIR}
        $ENV{OSGDIR}
        $ENV{OSG_DIR}
        $ENV{OSG}
        /usr/local/
        /usr/
        /sw/ # Fink
        /opt/local/ # DarwinPorts
        /opt/csw/ # Blastwave
        /opt/
        [HKEY_LOCAL_MACHINE\\SYSTEM\\CurrentControlSet\\Control\\Session\ Manager\\Environment;OSG_ROOT]/
        ~/Library/Frameworks
        /Library/Frameworks
        PATH_SUFFIXES
        /include
        )

IF(NOT OSG_GEN_INCLUDE_DIR)
    SET(OSG_GEN_INCLUDE_DIR  ${OSG_BUILD_DIR}/include)
ENDIF()
###### libraries ######

MACRO( FIND_OSG_LIBRARY MYLIBRARY MYLIBRARYNAME )

FIND_LIBRARY(${MYLIBRARY}
    NAMES
        ${MYLIBRARYNAME}
    PATHS
        ${OSG_DIR}
        ${OSG_BUILD_DIR}
        $ENV{OSG_BUILD_DIR}
        $ENV{OSG_DIR}
        $ENV{OSGDIR}
        $ENV{OSG_ROOT}
        $ENV{OSG}
        ~/Library/Frameworks
        /Library/Frameworks
        /usr/local
        /usr
        /sw
        /opt/local
        /opt/csw
        /opt
        [HKEY_LOCAL_MACHINE\\SYSTEM\\CurrentControlSet\\Control\\Session\ Manager\\Environment;OSG_ROOT]/lib
        /usr/freeware
    PATH_SUFFIXES
        /lib/
        /lib64/
        /build/lib/
        /build/lib64/
        /Build/lib/
        /Build/lib64/
     )
IF(NOT ${MYLIBRARY})
    set(${MYLIBRARY} ${OSG_BUILD_DIR}/lib/lib${MYLIBRARYNAME}.a)
ENDIF()
ENDMACRO(FIND_OSG_LIBRARY LIBRARY LIBRARYNAME)

FIND_OSG_LIBRARY( OSG_LIBRARY osg )
FIND_OSG_LIBRARY( OSG_LIBRARY_DEBUG osg)

FIND_OSG_LIBRARY( OSGUTIL_LIBRARY osgUtil )
FIND_OSG_LIBRARY( OSGUTIL_LIBRARY_DEBUG osgUtil)

FIND_OSG_LIBRARY( OSGDB_LIBRARY osgDB )
FIND_OSG_LIBRARY( OSGDB_LIBRARY_DEBUG osgDB)

FIND_OSG_LIBRARY( OSGTEXT_LIBRARY osgText )
FIND_OSG_LIBRARY( OSGTEXT_LIBRARY_DEBUG osgText )

FIND_OSG_LIBRARY( OSGTERRAIN_LIBRARY osgTerrain )
FIND_OSG_LIBRARY( OSGTERRAIN_LIBRARY_DEBUG osgTerrain )

FIND_OSG_LIBRARY( OSGFX_LIBRARY osgFX )
FIND_OSG_LIBRARY( OSGFX_LIBRARY_DEBUG osgFX )

FIND_OSG_LIBRARY( OSGSIM_LIBRARY osgSim )
FIND_OSG_LIBRARY( OSGSIM_LIBRARY_DEBUG osgSim )

FIND_OSG_LIBRARY( OSGVIEWER_LIBRARY osgViewer )
FIND_OSG_LIBRARY( OSGVIEWER_LIBRARY_DEBUG osgViewer )

FIND_OSG_LIBRARY( OSGGA_LIBRARY osgGA )
FIND_OSG_LIBRARY( OSGGA_LIBRARY_DEBUG osgGA )

FIND_OSG_LIBRARY( OSGWIDGET_LIBRARY osgWidget )
FIND_OSG_LIBRARY( OSGWIDGET_LIBRARY_DEBUG osgWidget )

FIND_OSG_LIBRARY( OSGSHADOW_LIBRARY osgShadow )
FIND_OSG_LIBRARY( OSGSHADOW_LIBRARY_DEBUG osgShadow )

FIND_OSG_LIBRARY( OSGMANIPULATOR_LIBRARY osgManipulator )
FIND_OSG_LIBRARY( OSGMANIPULATOR_LIBRARY_DEBUG osgManipulator )

FIND_OSG_LIBRARY( OSGPARTICLE_LIBRARY osgParticle )
FIND_OSG_LIBRARY( OSGPARTICLE_LIBRARY_DEBUG osgParticle )

FIND_OSG_LIBRARY( OPENTHREADS_LIBRARY OpenThreads )
FIND_OSG_LIBRARY( OPENTHREADS_LIBRARY_DEBUG OpenThreads )

SET( OSG_FOUND "NO" )
IF( OSG_LIBRARY AND OSG_INCLUDE_DIR )
    SET( OSG_FOUND "YES" )
    SET( OSG_INCLUDE_DIRS ${OSG_INCLUDE_DIR} ${OSG_GEN_INCLUDE_DIR} )
    GET_FILENAME_COMPONENT( OSG_LIBRARIES_DIR ${OSG_LIBRARY} PATH )
    message(OSG_LIBRARIES_DIR:-------------${OSG_LIBRARIES_DIR})
ENDIF( OSG_LIBRARY AND OSG_INCLUDE_DIR )


