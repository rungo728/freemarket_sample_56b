#carrierwaveの設定呼び出し
# require 'carrierwave/storage/abstract'
# require 'carrierwave/storage/file'
# require 'carrierwave/storage/fog'

#保存先の分岐
# CarrierWave.configure do |config|
#   if Rails.env.production? #本番環境
#     config.storage = :fog
#     config.fog_provider = 'fog/aws'
#     config.fog_credentials = {
#       provider: 'AWS',
#       aws_access_key_id: ENV["AWS_ACCESS_KEY_ID"],
#       aws_secret_access_key: ENV["AWS_SECRET_ACCESS_KEY"],
#       region: 'ap-northeast-1'
#     }

#     config.fog_directory  = 'freemarket56b'
#     config.asset_host = 'https://freemarket56b.s3.amazonaws.com'
#   else
#     config.storage :file # 開発環境はpublic/uploades下に保存
#     config.enable_processing = false if Rails.env.test? #test:処理をスキップ
#   end  
# end