#!/bin/bash

# Renk tanımlamaları
GREEN='\033[0;32m'
RED='\033[0;31m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Proje: TRIVE
# Bu script, Firebase App Distribution'a APK veya IPA dosyalarını yükler ve ardından bu dosyaları siler.

# Yükleme animasyonu fonksiyonu
show_upload_animation() {
    local pid=$1
    local message=$2
    local spin='-\|/'
    local i=0
    while kill -0 $pid 2>/dev/null
    do
        i=$(( (i+1) % 4 ))
        printf "\r${GREEN}[%c] ${message}...${NC}" "${spin:$i:1}"
        sleep .1
    done
    printf "\r${GREEN}[✓] ${message} tamamlandı.${NC}\n"
}

echo -e "${GREEN}[✓]${NC} Script Başlatıldı"
echo -e "${GREEN}    •${NC} Proje: TRIVE"
echo -e "${GREEN}    •${NC} İşlem: Firebase App Distribution'a dosya yükleme"

# Firebase App ID
ANDROID_FIREBASE_APP_ID="1:51722858800:android:3e3ef08824bfe0a262d8f5"
IOS_FIREBASE_APP_ID="1:51722858800:ios:3b9d00d0e23da3a362d8f5"

# Test distribution group
FIREBASE_DISTRIBUTION_GROUPS="DevTeam"

# Dosyalar
APK_FILE="*.apk"
IPA_FILE="*.ipa"

echo -e "${GREEN}[✓]${NC} Ortam Değişkenleri Ayarlandı"
echo -e "${GREEN}    •${NC} Android Firebase App ID: $ANDROID_FIREBASE_APP_ID"
echo -e "${GREEN}    •${NC} IOS Firebase App ID: $IOS_FIREBASE_APP_ID"
echo -e "${GREEN}    •${NC} Dağıtım Grubu: $FIREBASE_DISTRIBUTION_GROUPS"

export PATH="/opt/homebrew/bin:$PATH"
export PATH="/opt/homebrew/bin/firebase:$PATH"

echo -e "${GREEN}[✓]${NC} PATH Güncellendi"

# Hata mesajlarını yakalamak için bir fonksiyon
capture_error() {
    ("$@") &
    local pid=$!
    show_upload_animation $pid "Bekleyin... | "
    wait $pid
    local exit_code=$?
    if [ $exit_code -ne 0 ]; then
        echo -e "\n${RED}[!]${NC} Hata Oluştu"
        echo -e "${RED}    •${NC} Hata Kodu: $exit_code"
        echo -e "${RED}    •${NC} Hata Mesajı:"
        "$@" 2>&1
        return 1
    fi
    return 0
}

# APK dosyasını kontrol et ve yükle
if ls $APK_FILE 1> /dev/null 2>&1; then
    echo -e "${GREEN}[✓]${NC} APK Dosyası Bulundu"
    echo -e "${GREEN}    •${NC} Dosya: $APK_FILE"
    if capture_error firebase appdistribution:distribute $APK_FILE --app $ANDROID_FIREBASE_APP_ID --groups $FIREBASE_DISTRIBUTION_GROUPS; then
        echo -e "${GREEN}[✓]${NC} APK Dosyası Yüklendi"
        echo -e "${GREEN}    •${NC} Dosya Siliniyor..."
        rm $APK_FILE
        echo -e "${GREEN}[✓]${NC} APK Dosyası Silindi"
    else
        echo -e "${RED}[!]${NC} APK Dosyası Yüklenemedi"
    fi
else
    echo -e "${RED}[!]${NC} APK Dosyası Bulunamadı"
    echo -e "${RED}    •${NC} Yükleme Atlandı"
fi

# IPA dosyasını kontrol et ve yükle
if ls $IPA_FILE 1> /dev/null 2>&1; then
    echo -e "${GREEN}[✓]${NC} IPA Dosyası Bulundu"
    echo -e "${GREEN}    •${NC} Dosya: $IPA_FILE"
    if capture_error firebase appdistribution:distribute $IPA_FILE --app $IOS_FIREBASE_APP_ID --groups $FIREBASE_DISTRIBUTION_GROUPS; then
        echo -e "${GREEN}[✓]${NC} IPA Dosyası Yüklendi"
        echo -e "${GREEN}    •${NC} Dosya Siliniyor..."
        rm $IPA_FILE
        echo -e "${GREEN}[✓]${NC} IPA Dosyası Silindi"
    else
        echo -e "${RED}[!]${NC} IPA Dosyası Yüklenemedi"
    fi
else
    echo -e "${RED}[!]${NC} IPA Dosyası Bulunamadı"
    echo -e "${RED}    •${NC} Yükleme Atlandı"
    echo -e "${RED}    •${NC} NOT: Eğer build alınamadıysa, IOS projesinde MEKSA framework'ü olup olmadığını kontrol edin. Varsa, gerçek cihazda çalıştırın."
fi

# İşlem tamamlandı mesajı için fonksiyon
show_completion_message() {
    echo -e "\n${BLUE}╔════════════════════════════════════════╗${NC}"
    echo -e "${BLUE}║${YELLOW}                                        ${BLUE}║${NC}"
    echo -e "${BLUE}║${YELLOW}        İŞLEM TAMAMLANDI!               ${BLUE}║${NC}"
    echo -e "${BLUE}║${YELLOW}                                        ${BLUE}║${NC}"
    echo -e "${BLUE}╚════════════════════════════════════════╝${NC}\n"
    
    # Terminal bip sesi (3 kez)
    for i in {1..3}; do
        echo -e "\a"
        sleep 0.3
    done
}

# Tamamlanma animasyonu
show_completion_animation() {
    echo -ne "\n${GREEN}İşlem Tamamlanıyor: "
    for i in {1..20}; do
        echo -ne "█"
        sleep 0.1
    done
    echo -e "${NC}"
    show_completion_message
}

# Script sonunda
show_completion_animation