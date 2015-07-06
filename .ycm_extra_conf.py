import os
import ycm_core

# These are the compilation flags that will be used in case there's no
# compilation database set (by default, one is not set).
# CHANGE THIS LIST OF FLAGS. YES, THIS IS THE DROID YOU HAVE BEEN LOOKING FOR.
flags = [
'-std=c++11',
# ...and the same thing goes for the magic -x option which specifies the
# language that the files to be compiled are written in. This is mostly
# relevant for c++ headers.
# For a C project, you would set this to 'c' instead of 'c++'.
'-x',
'c++',
# QT5
'-DQT_CORE_LIB',
'-DQT_GUI_LIB',
'-DQT_NETWORK_LIB',
'-DQT_QML_LIB',
'-DQT_QUICK_LIB',
'-DQT_SQL_LIB',
'-DQT_WIDGETS_LIB',
'-DQT_XML_LIB',

'-IC:\\Qt\\qt-5.4.2-x64-mingw510r0-seh-opengl-rev0\\qt-5.4.2-x64-mingw510r0-seh-opengl-rev0\\mkspecs\\win32-g++',
'-IC:\\Qt\\qt-5.4.2-x64-mingw510r0-seh-opengl-rev0\\qt-5.4.2-x64-mingw510r0-seh-opengl-rev0\\include',
'-IC:\\Qt\\qt-5.4.2-x64-mingw510r0-seh-opengl-rev0\\qt-5.4.2-x64-mingw510r0-seh-opengl-rev0\\include\\ActiveQt',
'-IC:\\Qt\\qt-5.4.2-x64-mingw510r0-seh-opengl-rev0\\qt-5.4.2-x64-mingw510r0-seh-opengl-rev0\\include\\Enginio',
'-IC:\\Qt\\qt-5.4.2-x64-mingw510r0-seh-opengl-rev0\\qt-5.4.2-x64-mingw510r0-seh-opengl-rev0\\include\\QtBluetooth',
'-IC:\\Qt\\qt-5.4.2-x64-mingw510r0-seh-opengl-rev0\\qt-5.4.2-x64-mingw510r0-seh-opengl-rev0\\include\\QtCLucene',
'-IC:\\Qt\\qt-5.4.2-x64-mingw510r0-seh-opengl-rev0\\qt-5.4.2-x64-mingw510r0-seh-opengl-rev0\\include\\QtConcurrent',
'-IC:\\Qt\\qt-5.4.2-x64-mingw510r0-seh-opengl-rev0\\qt-5.4.2-x64-mingw510r0-seh-opengl-rev0\\include\\QtCore',
'-IC:\\Qt\\qt-5.4.2-x64-mingw510r0-seh-opengl-rev0\\qt-5.4.2-x64-mingw510r0-seh-opengl-rev0\\include\\QtDBus',
'-IC:\\Qt\\qt-5.4.2-x64-mingw510r0-seh-opengl-rev0\\qt-5.4.2-x64-mingw510r0-seh-opengl-rev0\\include\\QtDeclarative',
'-IC:\\Qt\\qt-5.4.2-x64-mingw510r0-seh-opengl-rev0\\qt-5.4.2-x64-mingw510r0-seh-opengl-rev0\\include\\QtDesigner',
'-IC:\\Qt\\qt-5.4.2-x64-mingw510r0-seh-opengl-rev0\\qt-5.4.2-x64-mingw510r0-seh-opengl-rev0\\include\\QtDesignerComponents',
'-IC:\\Qt\\qt-5.4.2-x64-mingw510r0-seh-opengl-rev0\\qt-5.4.2-x64-mingw510r0-seh-opengl-rev0\\include\\QtGui',
'-IC:\\Qt\\qt-5.4.2-x64-mingw510r0-seh-opengl-rev0\\qt-5.4.2-x64-mingw510r0-seh-opengl-rev0\\include\\QtHelp',
'-IC:\\Qt\\qt-5.4.2-x64-mingw510r0-seh-opengl-rev0\\qt-5.4.2-x64-mingw510r0-seh-opengl-rev0\\include\\QtLocation',
'-IC:\\Qt\\qt-5.4.2-x64-mingw510r0-seh-opengl-rev0\\qt-5.4.2-x64-mingw510r0-seh-opengl-rev0\\include\\QtMultimedia',
'-IC:\\Qt\\qt-5.4.2-x64-mingw510r0-seh-opengl-rev0\\qt-5.4.2-x64-mingw510r0-seh-opengl-rev0\\include\\QtMultimediaQuick_p',
'-IC:\\Qt\\qt-5.4.2-x64-mingw510r0-seh-opengl-rev0\\qt-5.4.2-x64-mingw510r0-seh-opengl-rev0\\include\\QtMultimediaWidgets',
'-IC:\\Qt\\qt-5.4.2-x64-mingw510r0-seh-opengl-rev0\\qt-5.4.2-x64-mingw510r0-seh-opengl-rev0\\include\\QtNetwork',
'-IC:\\Qt\\qt-5.4.2-x64-mingw510r0-seh-opengl-rev0\\qt-5.4.2-x64-mingw510r0-seh-opengl-rev0\\include\\QtNfc',
'-IC:\\Qt\\qt-5.4.2-x64-mingw510r0-seh-opengl-rev0\\qt-5.4.2-x64-mingw510r0-seh-opengl-rev0\\include\\QtOpenGL',
'-IC:\\Qt\\qt-5.4.2-x64-mingw510r0-seh-opengl-rev0\\qt-5.4.2-x64-mingw510r0-seh-opengl-rev0\\include\\QtOpenGLExtensions',
'-IC:\\Qt\\qt-5.4.2-x64-mingw510r0-seh-opengl-rev0\\qt-5.4.2-x64-mingw510r0-seh-opengl-rev0\\include\\QtPlatformHeaders',
'-IC:\\Qt\\qt-5.4.2-x64-mingw510r0-seh-opengl-rev0\\qt-5.4.2-x64-mingw510r0-seh-opengl-rev0\\include\\QtPlatformSupport',
'-IC:\\Qt\\qt-5.4.2-x64-mingw510r0-seh-opengl-rev0\\qt-5.4.2-x64-mingw510r0-seh-opengl-rev0\\include\\QtPositioning',
'-IC:\\Qt\\qt-5.4.2-x64-mingw510r0-seh-opengl-rev0\\qt-5.4.2-x64-mingw510r0-seh-opengl-rev0\\include\\QtPrintSupport',
'-IC:\\Qt\\qt-5.4.2-x64-mingw510r0-seh-opengl-rev0\\qt-5.4.2-x64-mingw510r0-seh-opengl-rev0\\include\\QtQml',
'-IC:\\Qt\\qt-5.4.2-x64-mingw510r0-seh-opengl-rev0\\qt-5.4.2-x64-mingw510r0-seh-opengl-rev0\\include\\QtQuick',
'-IC:\\Qt\\qt-5.4.2-x64-mingw510r0-seh-opengl-rev0\\qt-5.4.2-x64-mingw510r0-seh-opengl-rev0\\include\\QtQuickParticles',
'-IC:\\Qt\\qt-5.4.2-x64-mingw510r0-seh-opengl-rev0\\qt-5.4.2-x64-mingw510r0-seh-opengl-rev0\\include\\QtQuickTest',
'-IC:\\Qt\\qt-5.4.2-x64-mingw510r0-seh-opengl-rev0\\qt-5.4.2-x64-mingw510r0-seh-opengl-rev0\\include\\QtQuickWidgets',
'-IC:\\Qt\\qt-5.4.2-x64-mingw510r0-seh-opengl-rev0\\qt-5.4.2-x64-mingw510r0-seh-opengl-rev0\\include\\QtScript',
'-IC:\\Qt\\qt-5.4.2-x64-mingw510r0-seh-opengl-rev0\\qt-5.4.2-x64-mingw510r0-seh-opengl-rev0\\include\\QtScriptTools',
'-IC:\\Qt\\qt-5.4.2-x64-mingw510r0-seh-opengl-rev0\\qt-5.4.2-x64-mingw510r0-seh-opengl-rev0\\include\\QtSensors',
'-IC:\\Qt\\qt-5.4.2-x64-mingw510r0-seh-opengl-rev0\\qt-5.4.2-x64-mingw510r0-seh-opengl-rev0\\include\\QtSerialPort',
'-IC:\\Qt\\qt-5.4.2-x64-mingw510r0-seh-opengl-rev0\\qt-5.4.2-x64-mingw510r0-seh-opengl-rev0\\include\\QtSql',
'-IC:\\Qt\\qt-5.4.2-x64-mingw510r0-seh-opengl-rev0\\qt-5.4.2-x64-mingw510r0-seh-opengl-rev0\\include\\QtSvg',
'-IC:\\Qt\\qt-5.4.2-x64-mingw510r0-seh-opengl-rev0\\qt-5.4.2-x64-mingw510r0-seh-opengl-rev0\\include\\QtTest',
'-IC:\\Qt\\qt-5.4.2-x64-mingw510r0-seh-opengl-rev0\\qt-5.4.2-x64-mingw510r0-seh-opengl-rev0\\include\\QtUiTools',
'-IC:\\Qt\\qt-5.4.2-x64-mingw510r0-seh-opengl-rev0\\qt-5.4.2-x64-mingw510r0-seh-opengl-rev0\\include\\QtWebChannel',
'-IC:\\Qt\\qt-5.4.2-x64-mingw510r0-seh-opengl-rev0\\qt-5.4.2-x64-mingw510r0-seh-opengl-rev0\\include\\QtWebKit',
'-IC:\\Qt\\qt-5.4.2-x64-mingw510r0-seh-opengl-rev0\\qt-5.4.2-x64-mingw510r0-seh-opengl-rev0\\include\\QtWebKitWidgets',
'-IC:\\Qt\\qt-5.4.2-x64-mingw510r0-seh-opengl-rev0\\qt-5.4.2-x64-mingw510r0-seh-opengl-rev0\\include\\QtWebSockets',
'-IC:\\Qt\\qt-5.4.2-x64-mingw510r0-seh-opengl-rev0\\qt-5.4.2-x64-mingw510r0-seh-opengl-rev0\\include\\QtWidgets',
'-IC:\\Qt\\qt-5.4.2-x64-mingw510r0-seh-opengl-rev0\\qt-5.4.2-x64-mingw510r0-seh-opengl-rev0\\include\\QtWinExtras',
'-IC:\\Qt\\qt-5.4.2-x64-mingw510r0-seh-opengl-rev0\\qt-5.4.2-x64-mingw510r0-seh-opengl-rev0\\include\\QtXml',
'-IC:\\Qt\\qt-5.4.2-x64-mingw510r0-seh-opengl-rev0\\qt-5.4.2-x64-mingw510r0-seh-opengl-rev0\\include\\QtXmlPatterns',
'-IC:\\Qt\\qt-5.4.2-x64-mingw510r0-seh-opengl-rev0\\qt-5.4.2-x64-mingw510r0-seh-opengl-rev0\\include\\QtZlib',

'-I.',
]


# Set this to the absolute path to the folder (NOT the file!) containing the
# compile_commands.json file to use that instead of 'flags'. See here for
# more details: http://clang.llvm.org/docs/JSONCompilationDatabase.html
#
# You can get CMake to generate this file for you by adding:
#   set( CMAKE_EXPORT_COMPILE_COMMANDS 1 )
# to your CMakeLists.txt file.
#
# Most projects will NOT need to set this to anything; you can just change the
# 'flags' list of compilation flags. Notice that YCM itself uses that approach.
compilation_database_folder = ''

if os.path.exists( compilation_database_folder ):
  database = ycm_core.CompilationDatabase( compilation_database_folder )
else:
  database = None

SOURCE_EXTENSIONS = [ '.cpp', '.cxx', '.cc', '.c', '.m', '.mm' ]

def DirectoryOfThisScript():
  return os.path.dirname( os.path.abspath( __file__ ) )


def MakeRelativePathsInFlagsAbsolute( flags, working_directory ):
  if not working_directory:
    return list( flags )
  new_flags = []
  make_next_absolute = False
  path_flags = [ '-isystem', '-I', '-iquote', '--sysroot=' ]
  for flag in flags:
    new_flag = flag

    if make_next_absolute:
      make_next_absolute = False
      if not flag.startswith( '/' ):
        new_flag = os.path.join( working_directory, flag )

    for path_flag in path_flags:
      if flag == path_flag:
        make_next_absolute = True
        break

      if flag.startswith( path_flag ):
        path = flag[ len( path_flag ): ]
        new_flag = path_flag + os.path.join( working_directory, path )
        break

    if new_flag:
      new_flags.append( new_flag )
  return new_flags


def IsHeaderFile( filename ):
  extension = os.path.splitext( filename )[ 1 ]
  return extension in [ '.h', '.hxx', '.hpp', '.hh' ]


def GetCompilationInfoForFile( filename ):
  # The compilation_commands.json file generated by CMake does not have entries
  # for header files. So we do our best by asking the db for flags for a
  # corresponding source file, if any. If one exists, the flags for that file
  # should be good enough.
  if IsHeaderFile( filename ):
    basename = os.path.splitext( filename )[ 0 ]
    for extension in SOURCE_EXTENSIONS:
      replacement_file = basename + extension
      if os.path.exists( replacement_file ):
        compilation_info = database.GetCompilationInfoForFile(
          replacement_file )
        if compilation_info.compiler_flags_:
          return compilation_info
    return None
  return database.GetCompilationInfoForFile( filename )


def FlagsForFile( filename, **kwargs ):
  if database:
    # Bear in mind that compilation_info.compiler_flags_ does NOT return a
    # python list, but a "list-like" StringVec object
    compilation_info = GetCompilationInfoForFile( filename )
    if not compilation_info:
      return None

    final_flags = MakeRelativePathsInFlagsAbsolute(
      compilation_info.compiler_flags_,
      compilation_info.compiler_working_dir_ )

    # NOTE: This is just for YouCompleteMe; it's highly likely that your project
    # does NOT need to remove the stdlib flag. DO NOT USE THIS IN YOUR
    # ycm_extra_conf IF YOU'RE NOT 100% SURE YOU NEED IT.
    try:
      final_flags.remove( '-stdlib=libc++' )
    except ValueError:
      pass
  else:
    relative_to = DirectoryOfThisScript()
    final_flags = MakeRelativePathsInFlagsAbsolute( flags, relative_to )

  return {
    'flags': final_flags,
    'do_cache': True
  }
