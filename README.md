# Mic Fix Magisk Module

## Descriptions
- Fixes bad quality and cracking sounds input of microphone in audio/video recording by disabling handset noise canceler
- Changes microphone volumes (READ Optionals bellow!)
- Patching \*audio\*platform\*info\*.xml & \*mixer\*paths\*.xml file systemlessly

## Changelog

v2.13
- Support NoMount metamodule
- Resets module folders/files permissions at post-fs-data
- Move _uninstall.log to /data/adb/logs/

v2.12
- Fix wrong target in latest KernelSU

v2.11
- Improve /odm and /my_product support detection

v2.10
- Fix bug in uninstall.sh

v2.9
- Fix conflict with modules_update while installing via recovery if Magisk installed
- Improve xml patch detection

v2.8
- Re-add back mic volume optional
- Redirect /sdcard to /data/media/"$UID"
- Kitsune Mask detection

v2.7
- Add optional debug.log=1 for more detailed install log
- Specify UID at script

v2.6
- Patching \*audio\*platform\*info\*.xml instead of \*mixer\*paths\*.xml
- Remove mic.volume optional
- KernelSU support
- Magisk v26.1 support
- Save install log at /sdcard/..._recovery.log while installing via Recovery
- Creates /sdcard/optionals.prop file if it doesn't exist
- Using magiskpolicy --live --apply sepolicy.pfsd if sepolicy.sh=1
- Save uninstall log in /data/adb/modules/..._uninstall.log

v2.5
- Added mirror /odm and /my_product Magisk Delta Canary support
- Script enhancements

v2.4
- Script enhancements
- Copies /odm/etc/ & /my_product/etc/ audio files
- Fix AML detection

## Requirements
Magisk or Kitsune Mask or KernelSU or Apatch installed

## Installation Guide & Download Link
- Install this module https://devuploads.com/fn03ksdjmzls via Magisk app or Kitsune Mask app or KernelSU app or Apatch app or Recovery if Magisk or Kitsune Mask installed
- This is also an audio mod so, you need to install AML Magisk Module https://t.me/ryukinotes/34 if using any other else audio mod module
- Reboot

## Optionals
- https://t.me/ryukinotes/62
- Global: https://t.me/ryukinotes/35

## Troubleshootings
Global: https://t.me/ryukinotes/34

## Support & Bug Report
- https://t.me/ryukinotes/54
- If you don't do above, issues will be closed immediately

## Credits and Contributors
- https://t.me/viperatmos
- https://t.me/androidryukimodsdiscussions
- You can contribute ideas about this Magisk Module here: https://t.me/androidappsportdevelopment

## Sponsors
https://t.me/ryukinotes/25


