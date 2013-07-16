# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :json_web_key do
    kid "default-key"
    kty "RSA"
    alg "RS256"
    n "10409319199398370900985082208451099866094586719449270239771720334568454197271302907440183699346730616338447604886392158874663631198117046420761094142483149"
    e "65537"
    d "6462840810893384072525184171717888422591646453368186002659738779828042194286601505639031569536915908331320047930016600162886405056824921634063280555372793"
    p "107037454049619936205896089170926919713980289949737407998558328547756383004047"
    q "97249316062514585239444154174147094486044771121209390778726747125964504196067"
    dmp1 "82800216792858719590922899014274105447909711454321030460700239290562664588799"
    dmq1 "19073846966866998469075715363145806987253299479561553154244985390804396553645"
    iqmp "54101346723501851719211189808489391143621755577845765259462483305637701299384"
  end
end