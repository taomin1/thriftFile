namespace java com.meituan.baobab.ssc.meta


enum TResultCode {
  SUCCESS, BAD_REQUEST, UNAUTHORIZED, SERVER_ERROR
}

struct CategoryQuery {
  1:  i32 cat1Id;
  2:  i32 cat2Id;
  3:  i32 cat3Id;
}

struct CustomResult {
  1:  bool needSpu;
  2:  bool needSalesSpu;
  3:  bool needBaseSku;
  4:  bool needSku;
  5:  bool needCsu;
  6:  bool needCsuSalesInfo;
  7:  bool needProperty;
  8:  bool needCategory;
  9:  bool needWrappage;
  10:  bool needSourceSku;
  11:  bool needAbandonedSku;
  12:  bool needSalesSku;
}

struct PageRequestDto {
  1:  i32 page;
  2:  i32 size;
}

struct DetailCsuDto {
  1:  i32 csuCode;
  2:  i32 skuCode;
  3:  i32 baseSkuCode;
  4:  string spuCode;
  5:  i16 spuType;
  6:  string csuUnit;
  7:  i32 csuUnitId;
  8:  string csuUnitDesc;
  9:  i32 skuAmt;
  10:  i32 skuUnitId;
  11:  string skuUnit;
  12:  string skuUnitDesc;
  13:  i16 skuUnitType;
  14:  i32 conversionFactor;
  15:  string skuBarcode;
  16:  i32 grossWeight;
  17:  i32 netWeight;
  18:  string dealerSpuCode;
  19:  string name;
  20:  string aliasName;
  21:  i32 cat1Id;
  22:  i32 cat2Id;
  23:  i32 cat3Id;
  24:  i64 brandId;
  25:  string brand;
  26:  string producePlace;
  27:  i16 storage;
  28:  string transport;
  29:  i16 shelfLifeUnit;
  30:  i32 shelfLifeNumber;
  31:  string storageCondition;
  32:  string picUrls;
  33:  string descPicUrls;
  34:  string nutrientPicUrls;
  35:  string qualityPicUrls;
  36:  string videoUrl;
  37:  i64 dealerId;
  38:  string shelfLife;
}

struct BasicCsuGridDto {
  1:  i32 csuCode;
  2:  i32 buId;
  3:  i64 salesGridId;
  4:  i16 onShelf;
}

struct CategoryDto {
  1:  i32 id;
  2:  i32 parentId;
  3:  string name;
  4:  i16 level;
  5:  i32 sort;
  6:  i32 leaf;
  7:  string path;
}

struct SpuPropertyDto {
  1:  i32 id;
  2:  string spuCode;
  3:  string name;
  4:  string value;
  5:  i32 propId;
  6:  i32 valId;
  7:  i16 displayType;
}

struct PageDto {
  1:  i32 currentPageNo;
  2:  i32 pageSize;
  3:  i64 totalCount;
  4:  i32 totalPageCount;
}

struct AggregateCsuDto {
  1:  DetailCsuDto csu;
  2:  CategoryDto cat1;
  3:  CategoryDto cat2;
  4:  CategoryDto cat3;
  5:  list<SpuPropertyDto> propertyList;
}

struct DetailCsuAreaDto {
  1:  i32 csuCode;
  2:  i32 skuCode;
  3:  i32 baseSkuCode;
  4:  string spuCode;
  5:  i32 buId;
  6:  i16 onShelf;
  7:  i16 salesModelType;
  8:  i32 orderQuantity;
  9:  i16 multiOrder;
  10:  string tags;
  11:  i16 spuSalesStatus;
  12:  i16 customModel;
  13:  i16 profit;
  14:  string description;
  15:  string aliasName;
  16:  i64 salesGridId;
}

struct CsuFromSalesCategoryDto {
  1:  string spuCode;
  2:  i32 skuCode;
  3:  i32 csuCode;
  4:  i32 buId;
  5:  string name;
  6:  string skuUnitDesc;
  7:  string skuUnit;
  8:  i64 salesGridId;
}

struct IntegerResult {
  1:  i32 data;
  2:  TResultCode code;
  3:  string message;
}

struct SalesUnitQuery {
  1:  CustomResult customResult;
  2:  string indistinctSpuCode;
  3:  string spuCode;
  4:  i32 skuCode;
  5:  list<i32> csuCodeList;
  6:  list<i32> exclusionCsuCodeList;
  7:  i16 spuType;
  8:  string name;
  9:  i32 cat1Id;
  10:  i32 cat2Id;
  11:  i32 cat3Id;
  12:  i64 brandId;
  13:  i16 onShelf;
  14:  i16 profit;
  15:  i16 spuSalesStatus;
  16:  i16 customModel;
  17:  i16 salesModel;
  18:  i32 csuCode;
  19:  i16 skuStatus;
}

struct SalesUnit2GridResultDto {
  1:  DetailCsuDto csu;
  2:  list<BasicCsuGridDto> csuGridList;
  3:  CategoryDto cat1;
  4:  CategoryDto cat2;
  5:  CategoryDto cat3;
  6:  list<SpuPropertyDto> propertyList;
}

struct AggregateCsuPageResult {
  1:  list<AggregateCsuDto> data;
  2:  TResultCode code;
  3:  string message;
  4:  PageDto page;
}

struct CsuAreaResultDto {
  1:  DetailCsuDto csu;
  2:  DetailCsuAreaDto csuArea;
  3:  CategoryDto cat1;
  4:  CategoryDto cat2;
  5:  CategoryDto cat3;
  6:  list<SpuPropertyDto> propertyList;
}

struct CsuFromSalesCategoryPageResult {
  1:  list<CsuFromSalesCategoryDto> data;
  2:  TResultCode code;
  3:  string message;
  4:  PageDto page;
}

struct SalesUnit2GridPageResult {
  1:  list<SalesUnit2GridResultDto> data;
  2:  TResultCode code;
  3:  string message;
  4:  PageDto page;
}

struct PageContentDto {
  1:  list<CsuAreaResultDto> pageContent;
  2:  PageDto page;
}

struct CsuAreaPageResult {
  1:  PageContentDto data;
  2:  TResultCode code;
  3:  string message;
}

service TSalesUnitSearchService {
  IntegerResult countOnShelfSalesUnitByBuIdAndCategory(1:  i32 arg0, 2:  CategoryQuery arg1);
  IntegerResult countOnShelfSalesUnitBySalesGridIdAndCategory(1:  i64 arg0, 2:  CategoryQuery arg1);
  SalesUnit2GridPageResult pageGetSalesUnit2GridByBuId(1:  i32 arg0, 2:  list<i64> arg1, 3:  SalesUnitQuery arg2, 4:  PageRequestDto arg3);
  AggregateCsuPageResult pageGetSalesUnitByBuId(1:  i32 arg0, 2:  SalesUnitQuery arg1, 3:  PageRequestDto arg2);
  AggregateCsuPageResult pageGetSalesUnitByQuery(1:  SalesUnitQuery arg0, 2:  PageRequestDto arg1);
  CsuAreaPageResult pageGetSalesUnitBySalesGridId(1:  i64 arg0, 2:  SalesUnitQuery arg1, 3:  PageRequestDto arg2);
  CsuFromSalesCategoryPageResult pageGetSalesUnitBySalesGridIdAndSalesCategory(1:  i64 arg0, 2:  list<i32> arg1, 3:  PageRequestDto arg2);
  CsuAreaPageResult pageGetSalesUnitBySalesGridIdFilterWrappage(1:  i64 arg0, 2:  SalesUnitQuery arg1, 3:  PageRequestDto arg2);
  CsuAreaPageResult pageGetSalesUnitBySalesGridIdList(1:  list<i64> arg0, 2:  SalesUnitQuery arg1, 3:  PageRequestDto arg2);
}
