# **PP-Lib-Cmake**

Вспомогательная библиотка, с расширением для cmake файлов

Содержит cmake скрипты:

- **AISDK.cmake**
  Поиск AI SDK в окружени: `ADOBE_SDK_PATH`.
  Содержит макрос `Find_AI_SDK`

- **AESDK.cmake**
  Поиск After Effects SDK в окружении: `AE_SDK_BASE_PATH`.
  Содержит макрос `Find_AE_SDK`

- **PRSDK.cmake** 
Поиск Premier SDK в окружени: `PR_SDK_BASE_PATH`.
Содержит макрос `Find_PR_SDK`

- **ResBuild.cmake**
Скрипт для построение res файла поагина, с информаицей о плагине. Содержит функцию `res_build`

