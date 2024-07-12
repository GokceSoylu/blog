class Article < ApplicationRecord
    has_many :comments, dependent: :destroy #bu sayaede makale silindiği zaman makalenin yorumlarıda silinecek
    validates :title,  presence: true, 
    length: {minimum: 2}
end

#titile'ı nereden nasıl buluyor? Şimdi rails uygulamalarında kuduğun model sınıflar veri tabanıyla doğrudan ilişkilidir. bir dakika ya nasıl? ActiveRecord kütüphanesi (bir ORM(object relational mapping)kütüphanesidir) doğrudan nesneler ile veri tabanında işlem yapmamızı sağlar. rails de oluşturduğumuz modelleer ile veri tabanımızda bulunan tablolar arasında bağ kurar. Burad gördüğn gibi Article modeli ile veri tabanında bulunan articles tablosunu eşler.Tabi bu eşlemede tabloda buluna  sütünlar modelin attributları olur. Ayrıca ActiveRecord kütüphanesi validation(doğrulama) ve association(ilişki kurma) işlemi sağlar. bumnalr normalde biliyordsun veri tabani işlemleri ancak burad biz direkt sınıf içerisinde beri tabanına da müdehale wedecek şekilde direkt işeme yapabiliriz. Bu kütüphane rails kurulumnda doğrudan dahil edilir. bu sayede kurduğun sınıfın veri tabanı ile doğrudan bağ kurup buradaki sütünlara erişebilir ve üzerinde işlem yapabilir.
    #--> ActiveREcord kütüphanesi
   
    
#ActiveRecord hakkında
#hocam dediğimiz şey çok net sınıf oluştur gibi tıpkı oop sınıf yapısına uygun bir yapı oluşturuyoruz arkadaşın adına model diyoruz. ismi geçen kütüpühane sayesnide kuruşan model veri tabanındaki toblalarla eşleşiyor ve model ile veri tabanından dorudan veri çekebiliyor değişiklik yapabiliyoruz. Yani rasil de oluşturduğmuz model veri tabanıyla bağlantıs olan sınıf diyebilriz. Bu bağ kurma işlemin tarotçu abla değil ActiveRecord kğtğphanesi yapıyor. Şimdi model nasıl oluşturuturulur ona bakalım. 

# rails generate model Article title:string text:text 
#yukarıdaki kodu terminale yazarak model generate ediyoruz(oluşturuyoruz yani). Hocam dikkat edin veri tabanında bir tablo oluşturur gibi oluturduk modelimizi. ve biz modelin adını Article koyduk ya arkada articles adında bir tablo oluşturuluyor.
#oluşturduktan sonra rails db::migrate kodunu temşnalde çalıştırmamızın sebebi veri tabanını güncellemek için yuykarıda yeni model oluşturduk çünkü sonrasında veri tabanını migrate etmemiz gerekir. 

#daha sonra bu model ile veri tabanında CRUD create-read-update-delete işlemleri yapılabilir.

#Create
#article = Article.create(title: "The Title", text:"The text")

#Read
#article=Article.find(1)

#Update
#article.update(title:"Updated title") 
#delete
#article.destroy
# dikkat edelim diğerlerinde sınıf ile işlem yapıp atamada yapamamıza rağmen update ve delete için nesle ile çalıştırdık ve atama da yapmamız gerekli olmadı.

