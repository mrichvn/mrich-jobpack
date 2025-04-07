local Translations = {
    error = {
        het_da_tho = 'Bạn không còn đá thô!',
        het_go = "Bạn không còn gỗ khai thác!!",
        het_soi_vai = "Bạn không còn sợi vải nào!",
        het_cuon_vai = "Bạn không còn cuộn vải nào!",
    },
    success = {
        DaoDa = "Bạn đã nhận đá thô!",
        ruada = "Bạn đã nhận đá sạch!",

        chatgo = "Bạn đã khai thác gỗ!",
        xego = "Bạn đã xẻ được cơ số gỗ!",

        haisoivai = "Bạn đã thu hoạch sợi.",
        detvai = "Bạn đã dệt vải.",
        mayao = "Bạn đã may áo Sơ-Mi.",
    },
    info = {

    },
    progressbar = {
        daoda = "KHAI THÁC...",
        ruada = "RỬA ĐÁ...",
        nungda = "NUNG ĐÁ",

        chatgo = "KHAI THÁC...",
        xego = "CƯA VÁN GỖ...",
        bango = "GIAO DỊCH...",

        haisoivai = "THU HOẠCH...",
        detvai = "DỆT VẢI...",
        mayao = "MAY ÁO...",
        banao = "THƯƠNG LƯỢNG...",
    },
    target = {
        khaithacda = "Đào đá",
        ruada = "Rửa đá",
        nungda = "Nung đá",

        chatgo = "Chặt gỗ",
        xego = "Xẻ gỗ",
        bango = "Giao dịch",

        haisoivai = "Hái sợi",
        detvai = "Dệt vải",
        mayao = "May áo",
        banao = "Bán áo",
    },
}

Lang = Locale:new({
    phrases = Translations,
    warnOnMissing = true
})
