# Lokman To Do

Bu proje işe başvuru sürecindeki yaklaşım ve yetkinliğimin ölçülmesi için hazırlanmıştır. 
Proje Flutter ile yazılmıştır. Proje için verilen süre 24 saattir. Yazılan uygulama sadece android tarafında test edilmiştir. Geliştiriciye verilen dökümanda herhangi bir tasarım bulunmadığından uygulamanın tasarımı geliştiricinin deneyimlerine ve hayal gücüne dayalı yapılmıştır. 

## Projede Kullanılan Teknolojiler
Projede state management olarak getx kullanılmıştır. To Do ekranında eklenilen görevler için flutter secure storage paketi kullanılmıştır. Uygulamada kullanılan tüm ikonlar flutter'ın kendi ikonlarıdır. Yapılan tüm api istekleri http kullanılarak yapılmıştır. Kullanıcı giriş bilgilerinin kaydedilmesi shared preferences ile yapılmıştır. Uygulamada genel olarak lokman ecza deposunun logosundaki renklerinden birisi olan #FF423c60 hex koduna sahip renk kullanılmıştır. 

## Uygulama Özeti
Uygulamada login ekranı, kullanıcıların listelendiği ekran ve to do uygulamasının olduğu ekran olmak üzere 3 ana ekrandan oluşmaktadır. Uygulama açıldığında login ekranı gelmektedir. Kullanıcı email: 'eve.holt@reqres.in', password: 'cityslicka' bilgilerini girerek giriş yapabilir. Kullanıcı eğer isterse girilen şifreyi görünür veya görünmez yapabilir. Kullanıcı giriş yaparken başarısız olursa uyarı mesajı verilmektedir. Kullanıcı eğer başarılı bir şekilde giriş yaparsa shared preferences paketi kullanılarak kullanıcının başarılı giriş yaptığı kaydedilmekte ve uygulama kapatılıp tekrar girildiğinde direkt olarak ana sayfaya atmaktadır. 

Kullanıcı giriş yaptıktan sonra appbar'ın sağında bulunan butona tıkladığında kullanıcı çıkış işlemi yapılmaktadır. Kullanıcı butona tıkladıktan sonra her türlü tekrardan giriş yapmak zorundadır.  

Kullanıcı giriş yaptıktan sonra bottom navigation bar ile ayrılan iki ekran görmektedir. İlk ekranda kullanıcı bilgilerini çekmek için dökümanda verilmiş olan fake api'ye istek atılmaktadır. Api'den çekilen kullanıcı bilgileri bir listview ile ekrana basılmaktadır. 

İkinci ekranda ise basit bir to do app bulunmaktadır. Kullanıcı sağ alttaki + butona tıklayarak yeni bir görev ekleyebilir. Kullanıcı eklediği görevi çöp kutusu butonuna tıklayarak silebilir. Kullanıcının eklediği görevler flutter secure storage ile kaydedildiğinden dolayı uygulama kapatılıp açılsa bile o görevler orada kayıtlı kalacaktır. 

