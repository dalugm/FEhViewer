// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'view_history.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$ViewHistoryCWProxy {
  ViewHistory galleryProviderText(String galleryProviderText);

  ViewHistory gid(int gid);

  ViewHistory lastViewTime(int lastViewTime);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ViewHistory(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ViewHistory(...).copyWith(id: 12, name: "My name")
  /// ````
  ViewHistory call({
    String? galleryProviderText,
    int? gid,
    int? lastViewTime,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfViewHistory.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfViewHistory.copyWith.fieldName(...)`
class _$ViewHistoryCWProxyImpl implements _$ViewHistoryCWProxy {
  final ViewHistory _value;

  const _$ViewHistoryCWProxyImpl(this._value);

  @override
  ViewHistory galleryProviderText(String galleryProviderText) =>
      this(galleryProviderText: galleryProviderText);

  @override
  ViewHistory gid(int gid) => this(gid: gid);

  @override
  ViewHistory lastViewTime(int lastViewTime) =>
      this(lastViewTime: lastViewTime);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ViewHistory(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ViewHistory(...).copyWith(id: 12, name: "My name")
  /// ````
  ViewHistory call({
    Object? galleryProviderText = const $CopyWithPlaceholder(),
    Object? gid = const $CopyWithPlaceholder(),
    Object? lastViewTime = const $CopyWithPlaceholder(),
  }) {
    return ViewHistory(
      galleryProviderText:
          galleryProviderText == const $CopyWithPlaceholder() ||
                  galleryProviderText == null
              ? _value.galleryProviderText
              // ignore: cast_nullable_to_non_nullable
              : galleryProviderText as String,
      gid: gid == const $CopyWithPlaceholder() || gid == null
          ? _value.gid
          // ignore: cast_nullable_to_non_nullable
          : gid as int,
      lastViewTime:
          lastViewTime == const $CopyWithPlaceholder() || lastViewTime == null
              ? _value.lastViewTime
              // ignore: cast_nullable_to_non_nullable
              : lastViewTime as int,
    );
  }
}

extension $ViewHistoryCopyWith on ViewHistory {
  /// Returns a callable class that can be used as follows: `instanceOfViewHistory.copyWith(...)` or like so:`instanceOfViewHistory.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$ViewHistoryCWProxy get copyWith => _$ViewHistoryCWProxyImpl(this);
}

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings

extension GetViewHistoryCollection on Isar {
  IsarCollection<ViewHistory> get viewHistorys => collection();
}

const ViewHistorySchema = CollectionSchema(
  name: r'ViewHistory',
  schema:
      r'{"name":"ViewHistory","idName":"gid","properties":[{"name":"galleryProviderText","type":"String"},{"name":"lastViewTime","type":"Long"}],"indexes":[{"name":"lastViewTime","unique":false,"replace":false,"properties":[{"name":"lastViewTime","type":"Value","caseSensitive":false}]}],"links":[]}',
  idName: r'gid',
  propertyIds: {r'galleryProviderText': 0, r'lastViewTime': 1},
  listProperties: {},
  indexIds: {r'lastViewTime': 0},
  indexValueTypes: {
    r'lastViewTime': [
      IndexValueType.long,
    ]
  },
  linkIds: {},
  backlinkLinkNames: {},
  getId: _viewHistoryGetId,
  getLinks: _viewHistoryGetLinks,
  attachLinks: _viewHistoryAttachLinks,
  serializeNative: _viewHistorySerializeNative,
  deserializeNative: _viewHistoryDeserializeNative,
  deserializePropNative: _viewHistoryDeserializePropNative,
  serializeWeb: _viewHistorySerializeWeb,
  deserializeWeb: _viewHistoryDeserializeWeb,
  deserializePropWeb: _viewHistoryDeserializePropWeb,
  version: 4,
);

int? _viewHistoryGetId(ViewHistory object) {
  if (object.gid == Isar.autoIncrement) {
    return null;
  } else {
    return object.gid;
  }
}

List<IsarLinkBase<dynamic>> _viewHistoryGetLinks(ViewHistory object) {
  return [];
}

void _viewHistorySerializeNative(
    IsarCollection<ViewHistory> collection,
    IsarCObject cObj,
    ViewHistory object,
    int staticSize,
    List<int> offsets,
    AdapterAlloc alloc) {
  final galleryProviderText$Bytes =
      IsarBinaryWriter.utf8Encoder.convert(object.galleryProviderText);
  final size = (staticSize + 3 + (galleryProviderText$Bytes.length)) as int;
  cObj.buffer = alloc(size);
  cObj.buffer_length = size;

  final buffer = IsarNative.bufAsBytes(cObj.buffer, size);
  final writer = IsarBinaryWriter(buffer, staticSize);
  writer.writeHeader();
  writer.writeByteList(offsets[0], galleryProviderText$Bytes);
  writer.writeLong(offsets[1], object.lastViewTime);
}

ViewHistory _viewHistoryDeserializeNative(
    IsarCollection<ViewHistory> collection,
    int id,
    IsarBinaryReader reader,
    List<int> offsets) {
  final object = ViewHistory(
    galleryProviderText: reader.readString(offsets[0]),
    gid: id,
    lastViewTime: reader.readLong(offsets[1]),
  );
  return object;
}

P _viewHistoryDeserializePropNative<P>(
    int id, IsarBinaryReader reader, int propertyIndex, int offset) {
  switch (propertyIndex) {
    case -1:
      return id as P;
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readLong(offset)) as P;
    default:
      throw IsarError('Illegal propertyIndex');
  }
}

Object _viewHistorySerializeWeb(
    IsarCollection<ViewHistory> collection, ViewHistory object) {
  final jsObj = IsarNative.newJsObject();
  IsarNative.jsObjectSet(
      jsObj, r'galleryProviderText', object.galleryProviderText);
  IsarNative.jsObjectSet(jsObj, r'gid', object.gid);
  IsarNative.jsObjectSet(jsObj, r'lastViewTime', object.lastViewTime);
  return jsObj;
}

ViewHistory _viewHistoryDeserializeWeb(
    IsarCollection<ViewHistory> collection, Object jsObj) {
  final object = ViewHistory(
    galleryProviderText:
        IsarNative.jsObjectGet(jsObj, r'galleryProviderText') ?? '',
    gid: IsarNative.jsObjectGet(jsObj, r'gid'),
    lastViewTime: IsarNative.jsObjectGet(jsObj, r'lastViewTime') ??
        (double.negativeInfinity as int),
  );
  return object;
}

P _viewHistoryDeserializePropWeb<P>(Object jsObj, String propertyName) {
  switch (propertyName) {
    case r'galleryProviderText':
      return (IsarNative.jsObjectGet(jsObj, r'galleryProviderText') ?? '') as P;
    case r'gid':
      return (IsarNative.jsObjectGet(jsObj, r'gid')) as P;
    case r'lastViewTime':
      return (IsarNative.jsObjectGet(jsObj, r'lastViewTime') ??
          (double.negativeInfinity as int)) as P;
    default:
      throw IsarError('Illegal propertyName');
  }
}

void _viewHistoryAttachLinks(
    IsarCollection<dynamic> col, int id, ViewHistory object) {}

extension ViewHistoryQueryWhereSort
    on QueryBuilder<ViewHistory, ViewHistory, QWhere> {
  QueryBuilder<ViewHistory, ViewHistory, QAfterWhere> anyGid() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<ViewHistory, ViewHistory, QAfterWhere> anyLastViewTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'lastViewTime'),
      );
    });
  }
}

extension ViewHistoryQueryWhere
    on QueryBuilder<ViewHistory, ViewHistory, QWhereClause> {
  QueryBuilder<ViewHistory, ViewHistory, QAfterWhereClause> gidEqualTo(
      int gid) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: gid,
        upper: gid,
      ));
    });
  }

  QueryBuilder<ViewHistory, ViewHistory, QAfterWhereClause> gidNotEqualTo(
      int gid) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: gid, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: gid, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: gid, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: gid, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<ViewHistory, ViewHistory, QAfterWhereClause> gidGreaterThan(
      int gid,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: gid, includeLower: include),
      );
    });
  }

  QueryBuilder<ViewHistory, ViewHistory, QAfterWhereClause> gidLessThan(int gid,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: gid, includeUpper: include),
      );
    });
  }

  QueryBuilder<ViewHistory, ViewHistory, QAfterWhereClause> gidBetween(
    int lowerGid,
    int upperGid, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerGid,
        includeLower: includeLower,
        upper: upperGid,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ViewHistory, ViewHistory, QAfterWhereClause> lastViewTimeEqualTo(
      int lastViewTime) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'lastViewTime',
        value: [lastViewTime],
      ));
    });
  }

  QueryBuilder<ViewHistory, ViewHistory, QAfterWhereClause>
      lastViewTimeNotEqualTo(int lastViewTime) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'lastViewTime',
              lower: [],
              upper: [lastViewTime],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'lastViewTime',
              lower: [lastViewTime],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'lastViewTime',
              lower: [lastViewTime],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'lastViewTime',
              lower: [],
              upper: [lastViewTime],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<ViewHistory, ViewHistory, QAfterWhereClause>
      lastViewTimeGreaterThan(
    int lastViewTime, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'lastViewTime',
        lower: [lastViewTime],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<ViewHistory, ViewHistory, QAfterWhereClause>
      lastViewTimeLessThan(
    int lastViewTime, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'lastViewTime',
        lower: [],
        upper: [lastViewTime],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<ViewHistory, ViewHistory, QAfterWhereClause> lastViewTimeBetween(
    int lowerLastViewTime,
    int upperLastViewTime, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'lastViewTime',
        lower: [lowerLastViewTime],
        includeLower: includeLower,
        upper: [upperLastViewTime],
        includeUpper: includeUpper,
      ));
    });
  }
}

extension ViewHistoryQueryFilter
    on QueryBuilder<ViewHistory, ViewHistory, QFilterCondition> {
  QueryBuilder<ViewHistory, ViewHistory, QAfterFilterCondition>
      galleryProviderTextEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'galleryProviderText',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ViewHistory, ViewHistory, QAfterFilterCondition>
      galleryProviderTextGreaterThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'galleryProviderText',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ViewHistory, ViewHistory, QAfterFilterCondition>
      galleryProviderTextLessThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'galleryProviderText',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ViewHistory, ViewHistory, QAfterFilterCondition>
      galleryProviderTextBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'galleryProviderText',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ViewHistory, ViewHistory, QAfterFilterCondition>
      galleryProviderTextStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'galleryProviderText',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ViewHistory, ViewHistory, QAfterFilterCondition>
      galleryProviderTextEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'galleryProviderText',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ViewHistory, ViewHistory, QAfterFilterCondition>
      galleryProviderTextContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'galleryProviderText',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ViewHistory, ViewHistory, QAfterFilterCondition>
      galleryProviderTextMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'galleryProviderText',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ViewHistory, ViewHistory, QAfterFilterCondition> gidEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'gid',
        value: value,
      ));
    });
  }

  QueryBuilder<ViewHistory, ViewHistory, QAfterFilterCondition> gidGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'gid',
        value: value,
      ));
    });
  }

  QueryBuilder<ViewHistory, ViewHistory, QAfterFilterCondition> gidLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'gid',
        value: value,
      ));
    });
  }

  QueryBuilder<ViewHistory, ViewHistory, QAfterFilterCondition> gidBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'gid',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ViewHistory, ViewHistory, QAfterFilterCondition>
      lastViewTimeEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lastViewTime',
        value: value,
      ));
    });
  }

  QueryBuilder<ViewHistory, ViewHistory, QAfterFilterCondition>
      lastViewTimeGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'lastViewTime',
        value: value,
      ));
    });
  }

  QueryBuilder<ViewHistory, ViewHistory, QAfterFilterCondition>
      lastViewTimeLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'lastViewTime',
        value: value,
      ));
    });
  }

  QueryBuilder<ViewHistory, ViewHistory, QAfterFilterCondition>
      lastViewTimeBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'lastViewTime',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension ViewHistoryQueryLinks
    on QueryBuilder<ViewHistory, ViewHistory, QFilterCondition> {}

extension ViewHistoryQueryWhereSortBy
    on QueryBuilder<ViewHistory, ViewHistory, QSortBy> {
  QueryBuilder<ViewHistory, ViewHistory, QAfterSortBy>
      sortByGalleryProviderText() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'galleryProviderText', Sort.asc);
    });
  }

  QueryBuilder<ViewHistory, ViewHistory, QAfterSortBy>
      sortByGalleryProviderTextDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'galleryProviderText', Sort.desc);
    });
  }

  QueryBuilder<ViewHistory, ViewHistory, QAfterSortBy> sortByLastViewTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastViewTime', Sort.asc);
    });
  }

  QueryBuilder<ViewHistory, ViewHistory, QAfterSortBy>
      sortByLastViewTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastViewTime', Sort.desc);
    });
  }
}

extension ViewHistoryQueryWhereSortThenBy
    on QueryBuilder<ViewHistory, ViewHistory, QSortThenBy> {
  QueryBuilder<ViewHistory, ViewHistory, QAfterSortBy>
      thenByGalleryProviderText() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'galleryProviderText', Sort.asc);
    });
  }

  QueryBuilder<ViewHistory, ViewHistory, QAfterSortBy>
      thenByGalleryProviderTextDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'galleryProviderText', Sort.desc);
    });
  }

  QueryBuilder<ViewHistory, ViewHistory, QAfterSortBy> thenByGid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'gid', Sort.asc);
    });
  }

  QueryBuilder<ViewHistory, ViewHistory, QAfterSortBy> thenByGidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'gid', Sort.desc);
    });
  }

  QueryBuilder<ViewHistory, ViewHistory, QAfterSortBy> thenByLastViewTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastViewTime', Sort.asc);
    });
  }

  QueryBuilder<ViewHistory, ViewHistory, QAfterSortBy>
      thenByLastViewTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastViewTime', Sort.desc);
    });
  }
}

extension ViewHistoryQueryWhereDistinct
    on QueryBuilder<ViewHistory, ViewHistory, QDistinct> {
  QueryBuilder<ViewHistory, ViewHistory, QDistinct>
      distinctByGalleryProviderText({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'galleryProviderText',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ViewHistory, ViewHistory, QDistinct> distinctByLastViewTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lastViewTime');
    });
  }
}

extension ViewHistoryQueryProperty
    on QueryBuilder<ViewHistory, ViewHistory, QQueryProperty> {
  QueryBuilder<ViewHistory, int, QQueryOperations> gidProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'gid');
    });
  }

  QueryBuilder<ViewHistory, String, QQueryOperations>
      galleryProviderTextProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'galleryProviderText');
    });
  }

  QueryBuilder<ViewHistory, int, QQueryOperations> lastViewTimeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lastViewTime');
    });
  }
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ViewHistory _$ViewHistoryFromJson(Map<String, dynamic> json) => ViewHistory(
      gid: json['gid'] as int,
      lastViewTime: json['lastViewTime'] as int,
      galleryProviderText: json['galleryProviderText'] as String,
    );

Map<String, dynamic> _$ViewHistoryToJson(ViewHistory instance) =>
    <String, dynamic>{
      'gid': instance.gid,
      'lastViewTime': instance.lastViewTime,
      'galleryProviderText': instance.galleryProviderText,
    };
