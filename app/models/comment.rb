class Comment < ApplicationRecord
  belongs_to :article
end
#burada gördüğün belongs_to iafdesi comments modelinin articles modeline bağımlı olduğunu belirtir
#bu ifade genellikle one_to_many ileşkisi için kallanılır. yani bir article birden çok yoruma sahip olabilir. Ancak bir
#yorum sadece bir article'a ait olabilir. ve artikle ait olmak zorunda dır ona bağımlıdır.