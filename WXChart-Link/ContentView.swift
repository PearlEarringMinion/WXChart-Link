//
//  ContentView.swift
//  chart
//
//  Created by 篠原航平 on 2021/05/25.
//

import SwiftUI
//import GoogleMobileAds

/*
//広告バナーの定義
var bannerView : GADBannerView!
*/
//webデータを構造体で定義する
struct webData: Identifiable{
    var id = UUID()
    var name: String
    var url: String
    var favicon: String
}

struct webData1: Identifiable{
    var id = UUID()
    var name: String
    var url: String
    var favicon: String
}

struct webData2: Identifiable{
    var id = UUID()
    var name: String
    var url: String
    var favicon: String
}

struct webData3: Identifiable{
    var id = UUID()
    var name: String
    var url: String
    var favicon: String
}

/*
//Admobの実装
struct AdView: UIViewRepresentable {
    func makeUIView(context: Context) -> GADBannerView {
        let banner = GADBannerView(adSize: kGADAdSizeBanner)
        // 以下は、バナー広告向けのテスト専用広告ユニットID。リリース時広告ユニットIDと置き換え必要。
        banner.adUnitID = "ca-app-pub-3940256099942544/2934735716"
        banner.rootViewController = UIApplication.shared.windows.first?.rootViewController
        banner.load(GADRequest())
        return banner
    }

    func updateUIView(_ uiView: GADBannerView, context: Context) {
    }
}
*/


struct ContentView: View {
    // 選択しているタブを保持するための変数
    @State private var selection = 0
    
    //webデータのリスト（実況天気図のurl）
    let webList = [
        webData(name:"ASAS",url:"https://www.data.jma.go.jp/fcd/yoho/data/wxchart/quick/ASAS_COLOR.pdf",favicon:""),
        webData(name:"AUPQ78",url:"https://www.jma.go.jp/bosai/numericmap/data/nwpmap/aupq78_12.pdf",favicon:""),
        webData(name:"AUPQ35",url:"https://www.jma.go.jp/bosai/numericmap/data/nwpmap/aupq35_12.pdf",favicon:""),
        webData(name:"AXJP130/140",url:"https://www.jma.go.jp/bosai/numericmap/data/nwpmap/axjp140_12.pdf",favicon:""),
        webData(name:"AUPA20",url:"https://www.jma.go.jp/bosai/numericmap/data/nwpmap/aupa20_12.pdf",favicon:""),
        webData(name:"AUPA25",url:"https://www.jma.go.jp/bosai/numericmap/data/nwpmap/aupa25_12.pdf",favicon:""),
        webData(name:"AUPN30",url:"https://www.jma.go.jp/bosai/numericmap/data/nwpmap/aupn30_12.pdf",favicon:""),
        webData(name:"AUXN50",url:"https://www.jma.go.jp/bosai/numericmap/data/nwpmap/auxn50_12.pdf",favicon:""),
    ]
    
    //webデータのリスト（高層天気図のurl）
    let webList1 = [
        webData1(name:"FSAS24",url:"https://www.data.jma.go.jp/fcd/yoho/data/wxchart/quick/FSAS24_COLOR_ASIA.pdf",favicon:""),
        webData1(name:"FSAS48",url:"https://www.data.jma.go.jp/fcd/yoho/data/wxchart/quick/FSAS48_COLOR_ASIA.pdf",favicon:""),
        webData1(name:"FXFE502",url:"https://www.jma.go.jp/bosai/numericmap/data/nwpmap/fxfe502_12.pdf",favicon:""),
        webData1(name:"FXFE504",url:"https://www.jma.go.jp/bosai/numericmap/data/nwpmap/fxfe504_12.pdf",favicon:""),
        webData1(name:"FXFE5782",url:"https://www.jma.go.jp/bosai/numericmap/data/nwpmap/fxfe5782_12.pdf",favicon:""),
        webData1(name:"FXFE5784",url:"https://www.jma.go.jp/bosai/numericmap/data/nwpmap/fxfe5784_12.pdf",favicon:""),
        webData1(name:"FXJP854",url:"https://www.jma.go.jp/bosai/numericmap/data/nwpmap/fxjp854_12.pdf",favicon:""),
        webData1(name:"FUPA252",url:"https://www.jma.go.jp/bosai/numericmap/data/nwpmap/fupa252_12.pdf",favicon:""),
        webData1(name:"FUPA302",url:"https://www.jma.go.jp/bosai/numericmap/data/nwpmap/fupa302_12.pdf",favicon:""),
        webData1(name:"FUPA402",url:"https://www.jma.go.jp/bosai/numericmap/data/nwpmap/fupa402_12.pdf",favicon:""),
        webData1(name:"FUPA502",url:"https://www.jma.go.jp/bosai/numericmap/data/nwpmap/fupa502_12.pdf",favicon:""),
    ]
    
    //webデータのリスト（その他のurl）
    let webList2 = [
        webData2(name:"気象衛星",url:"https://www.jma.go.jp/bosai/map.html#4/30.676/132.539/&elem=vis&contents=himawari",favicon:"satelite"),
        webData2(name:"雨雲の動き（ナウキャスト）",url:"https://www.jma.go.jp/bosai/nowc/#lat:36.721274/lon:138.823242/zoom:5/colordepth:normal/elements:hrpns",favicon:"rain"),
        webData2(name:"今後の雨（降水短時間予報）",url:"https://www.jma.go.jp/bosai/kaikotan/#zoom:5/lat:36.721274/lon:138.823242/colordepth:normal/elements:rasrf",favicon:"rain"),
        webData2(name:"アメダス",url:"https://www.jma.go.jp/bosai/map.html#5/34.5/137/&elem=temp&contents=amedas&interval=60",favicon:"amedas"),
        webData2(name:"天気予報",url:"https://www.jma.go.jp/bosai/map.html#5/34.5/137/&contents=forecast",favicon:"forecast"),
        webData2(name:"台風情報",url:"https://www.jma.go.jp/bosai/map.html#5/8.016/125.991/&elem=root&typhoon=all&contents=typhoon",favicon:"typhoon"),
        webData2(name:"飛行場時系列予報",url:"https://www.data.jma.go.jp/airinfo/data/awfo_taf.html#contents_area2",favicon:"aircraft"),
        webData2(name:"下層悪天予報図",url:"https://www.data.jma.go.jp/airinfo/data/awfo_low-level_sigwx.html#contents_area2",favicon:"lower"),
        webData2(name:"現在の霧（霧プロダクト）",url:"https://www.data.jma.go.jp/omaad/aviation/jp/fog/#zoom:7/lat:36.142311/lon:139.042969/colordepth:normal/elements:fog",favicon:"fog"),
        webData2(name:"ウインドプロファイラ",url:"https://www.jma.go.jp/bosai/map.html#5/34.5/137/&contents=windprofiler",favicon:"wind"),
    ]
    
    //webデータのリスト（高層天気図（長期）のurl）
    let webList3 = [
        webData3(name:"FCVX21",url:"https://www.data.jma.go.jp/gmd/cpd/data/longfcst/fax/fcvx21_12.png",favicon:""),
        webData3(name:"FCVX22",url:"https://www.data.jma.go.jp/gmd/cpd/data/longfcst/fax/fcvx22_12.png",favicon:""),
        webData3(name:"FCVX23",url:"https://www.data.jma.go.jp/gmd/cpd/data/longfcst/fax/fcvx23_12.png",favicon:""),
        webData3(name:"FCVX24",url:"https://www.data.jma.go.jp/gmd/cpd/data/longfcst/fax/fcvx24_12.png",favicon:""),
        webData3(name:"FCVX11",url:"https://www.data.jma.go.jp/gmd/cpd/data/longfcst/fax/fcvx11_12.png",favicon:""),
        webData3(name:"FCVX12",url:"https://www.data.jma.go.jp/gmd/cpd/data/longfcst/fax/fcvx12_12.png",favicon:""),
        webData3(name:"FCVX13",url:"https://www.data.jma.go.jp/gmd/cpd/data/longfcst/fax/fcvx13_12.png",favicon:""),
        webData3(name:"FCVX14",url:"https://www.data.jma.go.jp/gmd/cpd/data/longfcst/fax/fcvx14_12.png",favicon:""),
        webData3(name:"FCVX15",url:"https://www.data.jma.go.jp/gmd/cpd/data/longfcst/fax/fcvx15_12.png",favicon:""),
    ]
    
    
    var body: some View {
        
        /*
        //AdmobのView
        AdView().frame(width: 320, height: 50)
        */
 
        TabView(selection: $selection) {
            NavigationView{
             List(webList){item in
                //ファビコン
                Image(item.favicon).resizable().frame(width:40,height:40)
                //リンクを作る
                Link(item .name,destination:URL(string: item.url)!)
             }
             .navigationBarTitle("気象庁　実況天気図")
             .navigationBarTitleDisplayMode(.inline)
        }
            //ipadに適応させる
            .navigationViewStyle(StackNavigationViewStyle())
                .tabItem {
                    Image(systemName: "cloud.sun")
                    Text("実況")
                }
                .tag(1)
            
            NavigationView{
             List(webList1){item in
                //ファビコン
                Image(item.favicon).resizable().frame(width:40,height:40)
                //リンクを作る
                Link(item .name,destination:URL(string: item.url)!)
             }
             .navigationBarTitle("気象庁　予想天気図")
             .navigationBarTitleDisplayMode(.inline)
        }
            //ipadに適応させる
            .navigationViewStyle(StackNavigationViewStyle())
                .tabItem {
                    Image(systemName: "cloud.drizzle")
                    Text("予想")
                }
                .tag(2)
            
            
            
            NavigationView{
             List(webList3){item in
                //ファビコン
                Image(item.favicon).resizable().frame(width:40,height:40)
                //リンクを作る
                Link(item .name,destination:URL(string: item.url)!)
             }
             .navigationBarTitle("気象庁　予想天気図（長期）")
             .navigationBarTitleDisplayMode(.inline)
        }
            //ipadに適応させる
            .navigationViewStyle(StackNavigationViewStyle())
                .tabItem {
                    Image(systemName: "cloud.drizzle.fill")
                    Text("予想（長期）")
                }
                .tag(3)
            
            NavigationView{
             List(webList2){item in
                //ファビコン
                Image(item.favicon).resizable().frame(width:40,height:40)
                //リンクを作る
                Link(item .name,destination:URL(string: item.url)!)
             }
             .navigationBarTitle("気象庁　気象情報")
             .navigationBarTitleDisplayMode(.inline)
        }
            //ipadに適応させる
            .navigationViewStyle(StackNavigationViewStyle())
                .tabItem {
                    Image(systemName: "sun.max.fill")
                    Text("気象情報")
                }
                .tag(4)
            
            NavigationView{
                VStack(alignment: .leading, spacing: 20.0){
                    Text("・「天気図リンク」をダウンロードいただき、ありがとうございます。")
                    Text("・このアプリは気象庁発表の最新天気図のリンクをまとめたシンプルなアプリです。全てのリンクは気象庁のHPにリンクします。通勤・通学時の電車の中で片手で簡単に天気図が確認できます！")
                    
                    HStack{
                        Text("・天気図の見方・読み方は")
                        Link("こちら", destination: URL(string: "https://www.jma.go.jp/jma/kishou/know/kurashi/tenkizu.html")!)
                        Text("をご覧下さい。")
                    }
                    Text("・2021年2月の気象庁HP大幅リニューアルに対応済みです。")
                }
             .navigationBarTitle("このアプリについて")
             .navigationBarTitleDisplayMode(.inline)
        }
            //ipadに適応させる
            .navigationViewStyle(StackNavigationViewStyle())
                .tabItem {
                    Image(systemName: "questionmark.circle")
                    Text("about")
                }
                .tag(5)
    }
        
}
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


