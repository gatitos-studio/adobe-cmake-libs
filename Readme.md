# **PP-Lib-Cmake**

Вспомогательная библиотка, с расширением для cmake файлов

Содержит cmake скрипты:
- **AESDK.cmake**
  Поиск After Effects SDK в окружении: `AE_SDK_BASE_PATH`.
  Содержит макрос `Find_AE_SDK`


- **PRSDK.cmake** 
Поиск Premier SDK в окружени: `PR_SDK_BASE_PATH`.
Содержит макрос `Find_PR_SDK`


- **PPLib.cmake** 
Поиск библиотеки PPLib, поиск в окружении: `PP_LIBS` 
Содержит макрос `Find_PP_Lib` для поиска и подключения к проекту `pp-lib` библиотеки и `AESDK` + `PRSDK`
Так-же содержит устаревший макрос, для поиска boost, библиотеки, не испольузется. Сейчас за внешние библиотеки отвечает `vcpkg`


- **PPLibBokeh.cmake**
Поиск библиотеки PPLibBokeh, поиск в окружении: `PP_LIBS`.
Содержит макрос `Find_PP_Lib_Bokeh`. 


- **PPLibAES.cmake**
Поиск библиотеки PPLibAES, поиск в окружении: `PP_LIBS`.
Содержит макрос `Find_PP_Lib_AES`. Данная библиотека так-же требует установленных зависимостей:
  `Boost, OpenSSL, libcurl`


- **PPLibs.cmake**
Вспомогательный скрипт, подключает все серипты для работы с библиотеками 
(AESDK, PRSDK, PPLib, PPLibAES, PPLibBokeh, OpenCL )


- **ResBuild.cmake**
Скрипт для построение res файла поагина, с информаицей о плагине. Содержит функцию `res_build`


- **LibEmbedBuild.cmake**
Скрипт для создания защищенной render библиотеки. Требуется собранная PPLibAES библиотека.


- **OpenCL.cmake** Пока в разработке. Вспомогательные макросы для подключения и сборки OpenCL эффектов

Папка `triplets` на данный момент пока не актуальная. 
Триплет `x64-windows-mixed.cmake` не используется.
Триплет `x64-windows-static-md.cmake` уже есть на данный момент в самом `vcpkg`.
