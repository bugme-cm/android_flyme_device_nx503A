#!/system/bin/sh
if [ -f /system/etc/recovery-transform.sh ]; then
  exec sh /system/etc/recovery-transform.sh 9197568 43fa99019d1b17aa32178b447d925be5fc9d7c7d 5705728 31771198ddbdcf7bc665656b571e19f93c8cfb66
fi

if ! applypatch -c EMMC:/dev/block/platform/msm_sdcc.1/by-name/recovery:9197568:43fa99019d1b17aa32178b447d925be5fc9d7c7d; then
  applypatch -b /system/etc/recovery-resource.dat EMMC:/dev/block/platform/msm_sdcc.1/by-name/boot:5705728:31771198ddbdcf7bc665656b571e19f93c8cfb66 EMMC:/dev/block/platform/msm_sdcc.1/by-name/recovery 43fa99019d1b17aa32178b447d925be5fc9d7c7d 9197568 31771198ddbdcf7bc665656b571e19f93c8cfb66:/system/recovery-from-boot.p && log -t recovery "Installing new recovery image: succeeded" || log -t recovery "Installing new recovery image: failed"
else
  log -t recovery "Recovery image already installed"
fi
