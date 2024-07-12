class ArticlesController < ApplicationController
    # http_basic_authenticate_with name: "ns",password:"ns_p", except: {:index, :show}
    def index
        @articles = Article.all #gördüğün .all metodu ile tüm articles alır ve @articles değiişkenine yükler. evet sdostum article dediğim arkadasş bir değişken ve istedğin isimlendirmeyi yapabilirsin burada articles adında yeni bir değişken oluşturuyoruz buna da tüm articles yükkklüyoruz. yani @article sdediğmiz arkadaş aslında bir dizi. üzer,nde bir döngü dahi yapabilirsin :))
        #Dostum C gibi alt level dillerde olduğu gibi değişken tipi tanımlamadan direkt kullandığımız için okurken ne olduğunu anlamakta zorlanabilirsin. bunun için bu değişkene ne atdığımıza bakabilirsin. @articles=Article.all demişiz tüm makaleleri atadığıjmıza göre demek ki bu bir diz:))
        #hmm unutmadan burada articles ismini okunabilirliği arttırmak için koyduk. yoksa bu bir değişken isimlemdirme kısmı opsiyonel. istersen mahmuts da koyabilirsin :)) 
    end

    def show #evet bu methodların sırası önemli
        @article = Article.find(params[:id])
    end

    def new 
        @article = Article.new
    end

    def edit
        @article = Article.find(params[:id])
    end


    def create
        @article = Article.new(article_params)
        if @article.save
            redirect_to @article
        else
            render :new, status: :unprocessable_entity#yeni şablona geri gönderiyoruz
        end
    end

    def update
        @article = Article.find(params[:id])
        if @article.update(article_params)
            redirect_to @article
        else
            render :edit, status: :unprocessable_entity
        end
    end

    def destroy
        @article = Article.find(params[:id])
        @article.destroy
        
        redirect_to articles_path
    end

    private
    def article_params
        params.require(:article).permit(:title, :text)
    end
    
end
