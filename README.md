# Mic Fix Magisk Module

## Descriptions
- Fixing bad quality or cracking sounds input of microphone in audio/video recording
- Patching mixer_paths*.xml files systemlessly

## Requirements
- Magisk installed

## Tested
- Android 10 arm64 CrDroid ROM

## Installation Guide
- Install the module via Magisk Manager or Recovery
- Install Audio Modification Library Module if you using other audio mods
- Reboot

## Optional
- The default mic volume value is 6. You can increase the mic volume using this command before flashing the module. This is for example to use volume 7:

  su

  `setprop mic.volume 7`

  You can change the value between 7 until 10. After that, reflash the module.

## Troubleshootings
- Use Audio Modification Library module if you using other module which also patching audio_platform_info.xml and/or mixer_paths*.xml.
- Delete /data/adb/modules/MicFix folder via recovery if you facing bootloop and send copied and zipped /data/system/dropbox files for fix.
- Open issues with sending those patched files and full logcats if this module is not working for your device.

## Thanks for Donations
- https://t.me/audioryukimods/2619
- https://www.paypal.me/reiryuki

## Download
- Tap "Releases"



       - Let's make sounds 🎙️🎶 -
