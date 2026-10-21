// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $UserProfilesTable extends UserProfiles
    with TableInfo<$UserProfilesTable, UserProfileRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $UserProfilesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _displayNameMeta =
      const VerificationMeta('displayName');
  @override
  late final GeneratedColumn<String> displayName = GeneratedColumn<String>(
      'display_name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _timezoneMeta =
      const VerificationMeta('timezone');
  @override
  late final GeneratedColumn<String> timezone = GeneratedColumn<String>(
      'timezone', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _localeMeta = const VerificationMeta('locale');
  @override
  late final GeneratedColumn<String> locale = GeneratedColumn<String>(
      'locale', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _preferredToneMeta =
      const VerificationMeta('preferredTone');
  @override
  late final GeneratedColumn<String> preferredTone = GeneratedColumn<String>(
      'preferred_tone', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _preferredNotificationLevelMeta =
      const VerificationMeta('preferredNotificationLevel');
  @override
  late final GeneratedColumn<String> preferredNotificationLevel =
      GeneratedColumn<String>(
          'preferred_notification_level', aliasedName, false,
          type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _defaultTravelBufferMinutesMeta =
      const VerificationMeta('defaultTravelBufferMinutes');
  @override
  late final GeneratedColumn<int> defaultTravelBufferMinutes =
      GeneratedColumn<int>('default_travel_buffer_minutes', aliasedName, false,
          type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _sleepStartHourMeta =
      const VerificationMeta('sleepStartHour');
  @override
  late final GeneratedColumn<int> sleepStartHour = GeneratedColumn<int>(
      'sleep_start_hour', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _sleepStartMinuteMeta =
      const VerificationMeta('sleepStartMinute');
  @override
  late final GeneratedColumn<int> sleepStartMinute = GeneratedColumn<int>(
      'sleep_start_minute', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _sleepEndHourMeta =
      const VerificationMeta('sleepEndHour');
  @override
  late final GeneratedColumn<int> sleepEndHour = GeneratedColumn<int>(
      'sleep_end_hour', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _sleepEndMinuteMeta =
      const VerificationMeta('sleepEndMinute');
  @override
  late final GeneratedColumn<int> sleepEndMinute = GeneratedColumn<int>(
      'sleep_end_minute', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _wakeStartHourMeta =
      const VerificationMeta('wakeStartHour');
  @override
  late final GeneratedColumn<int> wakeStartHour = GeneratedColumn<int>(
      'wake_start_hour', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _wakeStartMinuteMeta =
      const VerificationMeta('wakeStartMinute');
  @override
  late final GeneratedColumn<int> wakeStartMinute = GeneratedColumn<int>(
      'wake_start_minute', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _wakeEndHourMeta =
      const VerificationMeta('wakeEndHour');
  @override
  late final GeneratedColumn<int> wakeEndHour = GeneratedColumn<int>(
      'wake_end_hour', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _wakeEndMinuteMeta =
      const VerificationMeta('wakeEndMinute');
  @override
  late final GeneratedColumn<int> wakeEndMinute = GeneratedColumn<int>(
      'wake_end_minute', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        displayName,
        timezone,
        locale,
        preferredTone,
        preferredNotificationLevel,
        defaultTravelBufferMinutes,
        sleepStartHour,
        sleepStartMinute,
        sleepEndHour,
        sleepEndMinute,
        wakeStartHour,
        wakeStartMinute,
        wakeEndHour,
        wakeEndMinute,
        createdAt,
        updatedAt
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'user_profiles';
  @override
  VerificationContext validateIntegrity(Insertable<UserProfileRow> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('display_name')) {
      context.handle(
          _displayNameMeta,
          displayName.isAcceptableOrUnknown(
              data['display_name']!, _displayNameMeta));
    } else if (isInserting) {
      context.missing(_displayNameMeta);
    }
    if (data.containsKey('timezone')) {
      context.handle(_timezoneMeta,
          timezone.isAcceptableOrUnknown(data['timezone']!, _timezoneMeta));
    } else if (isInserting) {
      context.missing(_timezoneMeta);
    }
    if (data.containsKey('locale')) {
      context.handle(_localeMeta,
          locale.isAcceptableOrUnknown(data['locale']!, _localeMeta));
    } else if (isInserting) {
      context.missing(_localeMeta);
    }
    if (data.containsKey('preferred_tone')) {
      context.handle(
          _preferredToneMeta,
          preferredTone.isAcceptableOrUnknown(
              data['preferred_tone']!, _preferredToneMeta));
    } else if (isInserting) {
      context.missing(_preferredToneMeta);
    }
    if (data.containsKey('preferred_notification_level')) {
      context.handle(
          _preferredNotificationLevelMeta,
          preferredNotificationLevel.isAcceptableOrUnknown(
              data['preferred_notification_level']!,
              _preferredNotificationLevelMeta));
    } else if (isInserting) {
      context.missing(_preferredNotificationLevelMeta);
    }
    if (data.containsKey('default_travel_buffer_minutes')) {
      context.handle(
          _defaultTravelBufferMinutesMeta,
          defaultTravelBufferMinutes.isAcceptableOrUnknown(
              data['default_travel_buffer_minutes']!,
              _defaultTravelBufferMinutesMeta));
    } else if (isInserting) {
      context.missing(_defaultTravelBufferMinutesMeta);
    }
    if (data.containsKey('sleep_start_hour')) {
      context.handle(
          _sleepStartHourMeta,
          sleepStartHour.isAcceptableOrUnknown(
              data['sleep_start_hour']!, _sleepStartHourMeta));
    } else if (isInserting) {
      context.missing(_sleepStartHourMeta);
    }
    if (data.containsKey('sleep_start_minute')) {
      context.handle(
          _sleepStartMinuteMeta,
          sleepStartMinute.isAcceptableOrUnknown(
              data['sleep_start_minute']!, _sleepStartMinuteMeta));
    } else if (isInserting) {
      context.missing(_sleepStartMinuteMeta);
    }
    if (data.containsKey('sleep_end_hour')) {
      context.handle(
          _sleepEndHourMeta,
          sleepEndHour.isAcceptableOrUnknown(
              data['sleep_end_hour']!, _sleepEndHourMeta));
    } else if (isInserting) {
      context.missing(_sleepEndHourMeta);
    }
    if (data.containsKey('sleep_end_minute')) {
      context.handle(
          _sleepEndMinuteMeta,
          sleepEndMinute.isAcceptableOrUnknown(
              data['sleep_end_minute']!, _sleepEndMinuteMeta));
    } else if (isInserting) {
      context.missing(_sleepEndMinuteMeta);
    }
    if (data.containsKey('wake_start_hour')) {
      context.handle(
          _wakeStartHourMeta,
          wakeStartHour.isAcceptableOrUnknown(
              data['wake_start_hour']!, _wakeStartHourMeta));
    } else if (isInserting) {
      context.missing(_wakeStartHourMeta);
    }
    if (data.containsKey('wake_start_minute')) {
      context.handle(
          _wakeStartMinuteMeta,
          wakeStartMinute.isAcceptableOrUnknown(
              data['wake_start_minute']!, _wakeStartMinuteMeta));
    } else if (isInserting) {
      context.missing(_wakeStartMinuteMeta);
    }
    if (data.containsKey('wake_end_hour')) {
      context.handle(
          _wakeEndHourMeta,
          wakeEndHour.isAcceptableOrUnknown(
              data['wake_end_hour']!, _wakeEndHourMeta));
    } else if (isInserting) {
      context.missing(_wakeEndHourMeta);
    }
    if (data.containsKey('wake_end_minute')) {
      context.handle(
          _wakeEndMinuteMeta,
          wakeEndMinute.isAcceptableOrUnknown(
              data['wake_end_minute']!, _wakeEndMinuteMeta));
    } else if (isInserting) {
      context.missing(_wakeEndMinuteMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  UserProfileRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return UserProfileRow(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      displayName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}display_name'])!,
      timezone: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}timezone'])!,
      locale: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}locale'])!,
      preferredTone: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}preferred_tone'])!,
      preferredNotificationLevel: attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}preferred_notification_level'])!,
      defaultTravelBufferMinutes: attachedDatabase.typeMapping.read(
          DriftSqlType.int,
          data['${effectivePrefix}default_travel_buffer_minutes'])!,
      sleepStartHour: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}sleep_start_hour'])!,
      sleepStartMinute: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}sleep_start_minute'])!,
      sleepEndHour: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}sleep_end_hour'])!,
      sleepEndMinute: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}sleep_end_minute'])!,
      wakeStartHour: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}wake_start_hour'])!,
      wakeStartMinute: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}wake_start_minute'])!,
      wakeEndHour: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}wake_end_hour'])!,
      wakeEndMinute: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}wake_end_minute'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
    );
  }

  @override
  $UserProfilesTable createAlias(String alias) {
    return $UserProfilesTable(attachedDatabase, alias);
  }
}

class UserProfileRow extends DataClass implements Insertable<UserProfileRow> {
  final String id;
  final String displayName;
  final String timezone;
  final String locale;
  final String preferredTone;
  final String preferredNotificationLevel;
  final int defaultTravelBufferMinutes;
  final int sleepStartHour;
  final int sleepStartMinute;
  final int sleepEndHour;
  final int sleepEndMinute;
  final int wakeStartHour;
  final int wakeStartMinute;
  final int wakeEndHour;
  final int wakeEndMinute;
  final DateTime createdAt;
  final DateTime updatedAt;
  const UserProfileRow(
      {required this.id,
      required this.displayName,
      required this.timezone,
      required this.locale,
      required this.preferredTone,
      required this.preferredNotificationLevel,
      required this.defaultTravelBufferMinutes,
      required this.sleepStartHour,
      required this.sleepStartMinute,
      required this.sleepEndHour,
      required this.sleepEndMinute,
      required this.wakeStartHour,
      required this.wakeStartMinute,
      required this.wakeEndHour,
      required this.wakeEndMinute,
      required this.createdAt,
      required this.updatedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['display_name'] = Variable<String>(displayName);
    map['timezone'] = Variable<String>(timezone);
    map['locale'] = Variable<String>(locale);
    map['preferred_tone'] = Variable<String>(preferredTone);
    map['preferred_notification_level'] =
        Variable<String>(preferredNotificationLevel);
    map['default_travel_buffer_minutes'] =
        Variable<int>(defaultTravelBufferMinutes);
    map['sleep_start_hour'] = Variable<int>(sleepStartHour);
    map['sleep_start_minute'] = Variable<int>(sleepStartMinute);
    map['sleep_end_hour'] = Variable<int>(sleepEndHour);
    map['sleep_end_minute'] = Variable<int>(sleepEndMinute);
    map['wake_start_hour'] = Variable<int>(wakeStartHour);
    map['wake_start_minute'] = Variable<int>(wakeStartMinute);
    map['wake_end_hour'] = Variable<int>(wakeEndHour);
    map['wake_end_minute'] = Variable<int>(wakeEndMinute);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  UserProfilesCompanion toCompanion(bool nullToAbsent) {
    return UserProfilesCompanion(
      id: Value(id),
      displayName: Value(displayName),
      timezone: Value(timezone),
      locale: Value(locale),
      preferredTone: Value(preferredTone),
      preferredNotificationLevel: Value(preferredNotificationLevel),
      defaultTravelBufferMinutes: Value(defaultTravelBufferMinutes),
      sleepStartHour: Value(sleepStartHour),
      sleepStartMinute: Value(sleepStartMinute),
      sleepEndHour: Value(sleepEndHour),
      sleepEndMinute: Value(sleepEndMinute),
      wakeStartHour: Value(wakeStartHour),
      wakeStartMinute: Value(wakeStartMinute),
      wakeEndHour: Value(wakeEndHour),
      wakeEndMinute: Value(wakeEndMinute),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory UserProfileRow.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return UserProfileRow(
      id: serializer.fromJson<String>(json['id']),
      displayName: serializer.fromJson<String>(json['displayName']),
      timezone: serializer.fromJson<String>(json['timezone']),
      locale: serializer.fromJson<String>(json['locale']),
      preferredTone: serializer.fromJson<String>(json['preferredTone']),
      preferredNotificationLevel:
          serializer.fromJson<String>(json['preferredNotificationLevel']),
      defaultTravelBufferMinutes:
          serializer.fromJson<int>(json['defaultTravelBufferMinutes']),
      sleepStartHour: serializer.fromJson<int>(json['sleepStartHour']),
      sleepStartMinute: serializer.fromJson<int>(json['sleepStartMinute']),
      sleepEndHour: serializer.fromJson<int>(json['sleepEndHour']),
      sleepEndMinute: serializer.fromJson<int>(json['sleepEndMinute']),
      wakeStartHour: serializer.fromJson<int>(json['wakeStartHour']),
      wakeStartMinute: serializer.fromJson<int>(json['wakeStartMinute']),
      wakeEndHour: serializer.fromJson<int>(json['wakeEndHour']),
      wakeEndMinute: serializer.fromJson<int>(json['wakeEndMinute']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'displayName': serializer.toJson<String>(displayName),
      'timezone': serializer.toJson<String>(timezone),
      'locale': serializer.toJson<String>(locale),
      'preferredTone': serializer.toJson<String>(preferredTone),
      'preferredNotificationLevel':
          serializer.toJson<String>(preferredNotificationLevel),
      'defaultTravelBufferMinutes':
          serializer.toJson<int>(defaultTravelBufferMinutes),
      'sleepStartHour': serializer.toJson<int>(sleepStartHour),
      'sleepStartMinute': serializer.toJson<int>(sleepStartMinute),
      'sleepEndHour': serializer.toJson<int>(sleepEndHour),
      'sleepEndMinute': serializer.toJson<int>(sleepEndMinute),
      'wakeStartHour': serializer.toJson<int>(wakeStartHour),
      'wakeStartMinute': serializer.toJson<int>(wakeStartMinute),
      'wakeEndHour': serializer.toJson<int>(wakeEndHour),
      'wakeEndMinute': serializer.toJson<int>(wakeEndMinute),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  UserProfileRow copyWith(
          {String? id,
          String? displayName,
          String? timezone,
          String? locale,
          String? preferredTone,
          String? preferredNotificationLevel,
          int? defaultTravelBufferMinutes,
          int? sleepStartHour,
          int? sleepStartMinute,
          int? sleepEndHour,
          int? sleepEndMinute,
          int? wakeStartHour,
          int? wakeStartMinute,
          int? wakeEndHour,
          int? wakeEndMinute,
          DateTime? createdAt,
          DateTime? updatedAt}) =>
      UserProfileRow(
        id: id ?? this.id,
        displayName: displayName ?? this.displayName,
        timezone: timezone ?? this.timezone,
        locale: locale ?? this.locale,
        preferredTone: preferredTone ?? this.preferredTone,
        preferredNotificationLevel:
            preferredNotificationLevel ?? this.preferredNotificationLevel,
        defaultTravelBufferMinutes:
            defaultTravelBufferMinutes ?? this.defaultTravelBufferMinutes,
        sleepStartHour: sleepStartHour ?? this.sleepStartHour,
        sleepStartMinute: sleepStartMinute ?? this.sleepStartMinute,
        sleepEndHour: sleepEndHour ?? this.sleepEndHour,
        sleepEndMinute: sleepEndMinute ?? this.sleepEndMinute,
        wakeStartHour: wakeStartHour ?? this.wakeStartHour,
        wakeStartMinute: wakeStartMinute ?? this.wakeStartMinute,
        wakeEndHour: wakeEndHour ?? this.wakeEndHour,
        wakeEndMinute: wakeEndMinute ?? this.wakeEndMinute,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );
  UserProfileRow copyWithCompanion(UserProfilesCompanion data) {
    return UserProfileRow(
      id: data.id.present ? data.id.value : this.id,
      displayName:
          data.displayName.present ? data.displayName.value : this.displayName,
      timezone: data.timezone.present ? data.timezone.value : this.timezone,
      locale: data.locale.present ? data.locale.value : this.locale,
      preferredTone: data.preferredTone.present
          ? data.preferredTone.value
          : this.preferredTone,
      preferredNotificationLevel: data.preferredNotificationLevel.present
          ? data.preferredNotificationLevel.value
          : this.preferredNotificationLevel,
      defaultTravelBufferMinutes: data.defaultTravelBufferMinutes.present
          ? data.defaultTravelBufferMinutes.value
          : this.defaultTravelBufferMinutes,
      sleepStartHour: data.sleepStartHour.present
          ? data.sleepStartHour.value
          : this.sleepStartHour,
      sleepStartMinute: data.sleepStartMinute.present
          ? data.sleepStartMinute.value
          : this.sleepStartMinute,
      sleepEndHour: data.sleepEndHour.present
          ? data.sleepEndHour.value
          : this.sleepEndHour,
      sleepEndMinute: data.sleepEndMinute.present
          ? data.sleepEndMinute.value
          : this.sleepEndMinute,
      wakeStartHour: data.wakeStartHour.present
          ? data.wakeStartHour.value
          : this.wakeStartHour,
      wakeStartMinute: data.wakeStartMinute.present
          ? data.wakeStartMinute.value
          : this.wakeStartMinute,
      wakeEndHour:
          data.wakeEndHour.present ? data.wakeEndHour.value : this.wakeEndHour,
      wakeEndMinute: data.wakeEndMinute.present
          ? data.wakeEndMinute.value
          : this.wakeEndMinute,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('UserProfileRow(')
          ..write('id: $id, ')
          ..write('displayName: $displayName, ')
          ..write('timezone: $timezone, ')
          ..write('locale: $locale, ')
          ..write('preferredTone: $preferredTone, ')
          ..write('preferredNotificationLevel: $preferredNotificationLevel, ')
          ..write('defaultTravelBufferMinutes: $defaultTravelBufferMinutes, ')
          ..write('sleepStartHour: $sleepStartHour, ')
          ..write('sleepStartMinute: $sleepStartMinute, ')
          ..write('sleepEndHour: $sleepEndHour, ')
          ..write('sleepEndMinute: $sleepEndMinute, ')
          ..write('wakeStartHour: $wakeStartHour, ')
          ..write('wakeStartMinute: $wakeStartMinute, ')
          ..write('wakeEndHour: $wakeEndHour, ')
          ..write('wakeEndMinute: $wakeEndMinute, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      displayName,
      timezone,
      locale,
      preferredTone,
      preferredNotificationLevel,
      defaultTravelBufferMinutes,
      sleepStartHour,
      sleepStartMinute,
      sleepEndHour,
      sleepEndMinute,
      wakeStartHour,
      wakeStartMinute,
      wakeEndHour,
      wakeEndMinute,
      createdAt,
      updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UserProfileRow &&
          other.id == this.id &&
          other.displayName == this.displayName &&
          other.timezone == this.timezone &&
          other.locale == this.locale &&
          other.preferredTone == this.preferredTone &&
          other.preferredNotificationLevel == this.preferredNotificationLevel &&
          other.defaultTravelBufferMinutes == this.defaultTravelBufferMinutes &&
          other.sleepStartHour == this.sleepStartHour &&
          other.sleepStartMinute == this.sleepStartMinute &&
          other.sleepEndHour == this.sleepEndHour &&
          other.sleepEndMinute == this.sleepEndMinute &&
          other.wakeStartHour == this.wakeStartHour &&
          other.wakeStartMinute == this.wakeStartMinute &&
          other.wakeEndHour == this.wakeEndHour &&
          other.wakeEndMinute == this.wakeEndMinute &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class UserProfilesCompanion extends UpdateCompanion<UserProfileRow> {
  final Value<String> id;
  final Value<String> displayName;
  final Value<String> timezone;
  final Value<String> locale;
  final Value<String> preferredTone;
  final Value<String> preferredNotificationLevel;
  final Value<int> defaultTravelBufferMinutes;
  final Value<int> sleepStartHour;
  final Value<int> sleepStartMinute;
  final Value<int> sleepEndHour;
  final Value<int> sleepEndMinute;
  final Value<int> wakeStartHour;
  final Value<int> wakeStartMinute;
  final Value<int> wakeEndHour;
  final Value<int> wakeEndMinute;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<int> rowid;
  const UserProfilesCompanion({
    this.id = const Value.absent(),
    this.displayName = const Value.absent(),
    this.timezone = const Value.absent(),
    this.locale = const Value.absent(),
    this.preferredTone = const Value.absent(),
    this.preferredNotificationLevel = const Value.absent(),
    this.defaultTravelBufferMinutes = const Value.absent(),
    this.sleepStartHour = const Value.absent(),
    this.sleepStartMinute = const Value.absent(),
    this.sleepEndHour = const Value.absent(),
    this.sleepEndMinute = const Value.absent(),
    this.wakeStartHour = const Value.absent(),
    this.wakeStartMinute = const Value.absent(),
    this.wakeEndHour = const Value.absent(),
    this.wakeEndMinute = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  UserProfilesCompanion.insert({
    required String id,
    required String displayName,
    required String timezone,
    required String locale,
    required String preferredTone,
    required String preferredNotificationLevel,
    required int defaultTravelBufferMinutes,
    required int sleepStartHour,
    required int sleepStartMinute,
    required int sleepEndHour,
    required int sleepEndMinute,
    required int wakeStartHour,
    required int wakeStartMinute,
    required int wakeEndHour,
    required int wakeEndMinute,
    required DateTime createdAt,
    required DateTime updatedAt,
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        displayName = Value(displayName),
        timezone = Value(timezone),
        locale = Value(locale),
        preferredTone = Value(preferredTone),
        preferredNotificationLevel = Value(preferredNotificationLevel),
        defaultTravelBufferMinutes = Value(defaultTravelBufferMinutes),
        sleepStartHour = Value(sleepStartHour),
        sleepStartMinute = Value(sleepStartMinute),
        sleepEndHour = Value(sleepEndHour),
        sleepEndMinute = Value(sleepEndMinute),
        wakeStartHour = Value(wakeStartHour),
        wakeStartMinute = Value(wakeStartMinute),
        wakeEndHour = Value(wakeEndHour),
        wakeEndMinute = Value(wakeEndMinute),
        createdAt = Value(createdAt),
        updatedAt = Value(updatedAt);
  static Insertable<UserProfileRow> custom({
    Expression<String>? id,
    Expression<String>? displayName,
    Expression<String>? timezone,
    Expression<String>? locale,
    Expression<String>? preferredTone,
    Expression<String>? preferredNotificationLevel,
    Expression<int>? defaultTravelBufferMinutes,
    Expression<int>? sleepStartHour,
    Expression<int>? sleepStartMinute,
    Expression<int>? sleepEndHour,
    Expression<int>? sleepEndMinute,
    Expression<int>? wakeStartHour,
    Expression<int>? wakeStartMinute,
    Expression<int>? wakeEndHour,
    Expression<int>? wakeEndMinute,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (displayName != null) 'display_name': displayName,
      if (timezone != null) 'timezone': timezone,
      if (locale != null) 'locale': locale,
      if (preferredTone != null) 'preferred_tone': preferredTone,
      if (preferredNotificationLevel != null)
        'preferred_notification_level': preferredNotificationLevel,
      if (defaultTravelBufferMinutes != null)
        'default_travel_buffer_minutes': defaultTravelBufferMinutes,
      if (sleepStartHour != null) 'sleep_start_hour': sleepStartHour,
      if (sleepStartMinute != null) 'sleep_start_minute': sleepStartMinute,
      if (sleepEndHour != null) 'sleep_end_hour': sleepEndHour,
      if (sleepEndMinute != null) 'sleep_end_minute': sleepEndMinute,
      if (wakeStartHour != null) 'wake_start_hour': wakeStartHour,
      if (wakeStartMinute != null) 'wake_start_minute': wakeStartMinute,
      if (wakeEndHour != null) 'wake_end_hour': wakeEndHour,
      if (wakeEndMinute != null) 'wake_end_minute': wakeEndMinute,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  UserProfilesCompanion copyWith(
      {Value<String>? id,
      Value<String>? displayName,
      Value<String>? timezone,
      Value<String>? locale,
      Value<String>? preferredTone,
      Value<String>? preferredNotificationLevel,
      Value<int>? defaultTravelBufferMinutes,
      Value<int>? sleepStartHour,
      Value<int>? sleepStartMinute,
      Value<int>? sleepEndHour,
      Value<int>? sleepEndMinute,
      Value<int>? wakeStartHour,
      Value<int>? wakeStartMinute,
      Value<int>? wakeEndHour,
      Value<int>? wakeEndMinute,
      Value<DateTime>? createdAt,
      Value<DateTime>? updatedAt,
      Value<int>? rowid}) {
    return UserProfilesCompanion(
      id: id ?? this.id,
      displayName: displayName ?? this.displayName,
      timezone: timezone ?? this.timezone,
      locale: locale ?? this.locale,
      preferredTone: preferredTone ?? this.preferredTone,
      preferredNotificationLevel:
          preferredNotificationLevel ?? this.preferredNotificationLevel,
      defaultTravelBufferMinutes:
          defaultTravelBufferMinutes ?? this.defaultTravelBufferMinutes,
      sleepStartHour: sleepStartHour ?? this.sleepStartHour,
      sleepStartMinute: sleepStartMinute ?? this.sleepStartMinute,
      sleepEndHour: sleepEndHour ?? this.sleepEndHour,
      sleepEndMinute: sleepEndMinute ?? this.sleepEndMinute,
      wakeStartHour: wakeStartHour ?? this.wakeStartHour,
      wakeStartMinute: wakeStartMinute ?? this.wakeStartMinute,
      wakeEndHour: wakeEndHour ?? this.wakeEndHour,
      wakeEndMinute: wakeEndMinute ?? this.wakeEndMinute,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (displayName.present) {
      map['display_name'] = Variable<String>(displayName.value);
    }
    if (timezone.present) {
      map['timezone'] = Variable<String>(timezone.value);
    }
    if (locale.present) {
      map['locale'] = Variable<String>(locale.value);
    }
    if (preferredTone.present) {
      map['preferred_tone'] = Variable<String>(preferredTone.value);
    }
    if (preferredNotificationLevel.present) {
      map['preferred_notification_level'] =
          Variable<String>(preferredNotificationLevel.value);
    }
    if (defaultTravelBufferMinutes.present) {
      map['default_travel_buffer_minutes'] =
          Variable<int>(defaultTravelBufferMinutes.value);
    }
    if (sleepStartHour.present) {
      map['sleep_start_hour'] = Variable<int>(sleepStartHour.value);
    }
    if (sleepStartMinute.present) {
      map['sleep_start_minute'] = Variable<int>(sleepStartMinute.value);
    }
    if (sleepEndHour.present) {
      map['sleep_end_hour'] = Variable<int>(sleepEndHour.value);
    }
    if (sleepEndMinute.present) {
      map['sleep_end_minute'] = Variable<int>(sleepEndMinute.value);
    }
    if (wakeStartHour.present) {
      map['wake_start_hour'] = Variable<int>(wakeStartHour.value);
    }
    if (wakeStartMinute.present) {
      map['wake_start_minute'] = Variable<int>(wakeStartMinute.value);
    }
    if (wakeEndHour.present) {
      map['wake_end_hour'] = Variable<int>(wakeEndHour.value);
    }
    if (wakeEndMinute.present) {
      map['wake_end_minute'] = Variable<int>(wakeEndMinute.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UserProfilesCompanion(')
          ..write('id: $id, ')
          ..write('displayName: $displayName, ')
          ..write('timezone: $timezone, ')
          ..write('locale: $locale, ')
          ..write('preferredTone: $preferredTone, ')
          ..write('preferredNotificationLevel: $preferredNotificationLevel, ')
          ..write('defaultTravelBufferMinutes: $defaultTravelBufferMinutes, ')
          ..write('sleepStartHour: $sleepStartHour, ')
          ..write('sleepStartMinute: $sleepStartMinute, ')
          ..write('sleepEndHour: $sleepEndHour, ')
          ..write('sleepEndMinute: $sleepEndMinute, ')
          ..write('wakeStartHour: $wakeStartHour, ')
          ..write('wakeStartMinute: $wakeStartMinute, ')
          ..write('wakeEndHour: $wakeEndHour, ')
          ..write('wakeEndMinute: $wakeEndMinute, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $MemoriesTable extends Memories
    with TableInfo<$MemoriesTable, MemoryRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $MemoriesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumn<String> type = GeneratedColumn<String>(
      'type', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _valueMeta = const VerificationMeta('value');
  @override
  late final GeneratedColumn<String> value = GeneratedColumn<String>(
      'value', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _sourceMeta = const VerificationMeta('source');
  @override
  late final GeneratedColumn<String> source = GeneratedColumn<String>(
      'source', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _confidenceMeta =
      const VerificationMeta('confidence');
  @override
  late final GeneratedColumn<String> confidence = GeneratedColumn<String>(
      'confidence', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _conditionMeta =
      const VerificationMeta('condition');
  @override
  late final GeneratedColumn<String> condition = GeneratedColumn<String>(
      'condition', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _expiresAtMeta =
      const VerificationMeta('expiresAt');
  @override
  late final GeneratedColumn<DateTime> expiresAt = GeneratedColumn<DateTime>(
      'expires_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _lastUsedAtMeta =
      const VerificationMeta('lastUsedAt');
  @override
  late final GeneratedColumn<DateTime> lastUsedAt = GeneratedColumn<DateTime>(
      'last_used_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        type,
        title,
        value,
        source,
        confidence,
        condition,
        expiresAt,
        lastUsedAt,
        createdAt,
        updatedAt
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'memories';
  @override
  VerificationContext validateIntegrity(Insertable<MemoryRow> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('type')) {
      context.handle(
          _typeMeta, type.isAcceptableOrUnknown(data['type']!, _typeMeta));
    } else if (isInserting) {
      context.missing(_typeMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('value')) {
      context.handle(
          _valueMeta, value.isAcceptableOrUnknown(data['value']!, _valueMeta));
    } else if (isInserting) {
      context.missing(_valueMeta);
    }
    if (data.containsKey('source')) {
      context.handle(_sourceMeta,
          source.isAcceptableOrUnknown(data['source']!, _sourceMeta));
    } else if (isInserting) {
      context.missing(_sourceMeta);
    }
    if (data.containsKey('confidence')) {
      context.handle(
          _confidenceMeta,
          confidence.isAcceptableOrUnknown(
              data['confidence']!, _confidenceMeta));
    } else if (isInserting) {
      context.missing(_confidenceMeta);
    }
    if (data.containsKey('condition')) {
      context.handle(_conditionMeta,
          condition.isAcceptableOrUnknown(data['condition']!, _conditionMeta));
    }
    if (data.containsKey('expires_at')) {
      context.handle(_expiresAtMeta,
          expiresAt.isAcceptableOrUnknown(data['expires_at']!, _expiresAtMeta));
    }
    if (data.containsKey('last_used_at')) {
      context.handle(
          _lastUsedAtMeta,
          lastUsedAt.isAcceptableOrUnknown(
              data['last_used_at']!, _lastUsedAtMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  MemoryRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return MemoryRow(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      type: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}type'])!,
      title: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}title'])!,
      value: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}value'])!,
      source: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}source'])!,
      confidence: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}confidence'])!,
      condition: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}condition']),
      expiresAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}expires_at']),
      lastUsedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}last_used_at']),
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
    );
  }

  @override
  $MemoriesTable createAlias(String alias) {
    return $MemoriesTable(attachedDatabase, alias);
  }
}

class MemoryRow extends DataClass implements Insertable<MemoryRow> {
  final String id;
  final String type;
  final String title;
  final String value;
  final String source;
  final String confidence;
  final String? condition;
  final DateTime? expiresAt;
  final DateTime? lastUsedAt;
  final DateTime createdAt;
  final DateTime updatedAt;
  const MemoryRow(
      {required this.id,
      required this.type,
      required this.title,
      required this.value,
      required this.source,
      required this.confidence,
      this.condition,
      this.expiresAt,
      this.lastUsedAt,
      required this.createdAt,
      required this.updatedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['type'] = Variable<String>(type);
    map['title'] = Variable<String>(title);
    map['value'] = Variable<String>(value);
    map['source'] = Variable<String>(source);
    map['confidence'] = Variable<String>(confidence);
    if (!nullToAbsent || condition != null) {
      map['condition'] = Variable<String>(condition);
    }
    if (!nullToAbsent || expiresAt != null) {
      map['expires_at'] = Variable<DateTime>(expiresAt);
    }
    if (!nullToAbsent || lastUsedAt != null) {
      map['last_used_at'] = Variable<DateTime>(lastUsedAt);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  MemoriesCompanion toCompanion(bool nullToAbsent) {
    return MemoriesCompanion(
      id: Value(id),
      type: Value(type),
      title: Value(title),
      value: Value(value),
      source: Value(source),
      confidence: Value(confidence),
      condition: condition == null && nullToAbsent
          ? const Value.absent()
          : Value(condition),
      expiresAt: expiresAt == null && nullToAbsent
          ? const Value.absent()
          : Value(expiresAt),
      lastUsedAt: lastUsedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(lastUsedAt),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory MemoryRow.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return MemoryRow(
      id: serializer.fromJson<String>(json['id']),
      type: serializer.fromJson<String>(json['type']),
      title: serializer.fromJson<String>(json['title']),
      value: serializer.fromJson<String>(json['value']),
      source: serializer.fromJson<String>(json['source']),
      confidence: serializer.fromJson<String>(json['confidence']),
      condition: serializer.fromJson<String?>(json['condition']),
      expiresAt: serializer.fromJson<DateTime?>(json['expiresAt']),
      lastUsedAt: serializer.fromJson<DateTime?>(json['lastUsedAt']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'type': serializer.toJson<String>(type),
      'title': serializer.toJson<String>(title),
      'value': serializer.toJson<String>(value),
      'source': serializer.toJson<String>(source),
      'confidence': serializer.toJson<String>(confidence),
      'condition': serializer.toJson<String?>(condition),
      'expiresAt': serializer.toJson<DateTime?>(expiresAt),
      'lastUsedAt': serializer.toJson<DateTime?>(lastUsedAt),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  MemoryRow copyWith(
          {String? id,
          String? type,
          String? title,
          String? value,
          String? source,
          String? confidence,
          Value<String?> condition = const Value.absent(),
          Value<DateTime?> expiresAt = const Value.absent(),
          Value<DateTime?> lastUsedAt = const Value.absent(),
          DateTime? createdAt,
          DateTime? updatedAt}) =>
      MemoryRow(
        id: id ?? this.id,
        type: type ?? this.type,
        title: title ?? this.title,
        value: value ?? this.value,
        source: source ?? this.source,
        confidence: confidence ?? this.confidence,
        condition: condition.present ? condition.value : this.condition,
        expiresAt: expiresAt.present ? expiresAt.value : this.expiresAt,
        lastUsedAt: lastUsedAt.present ? lastUsedAt.value : this.lastUsedAt,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );
  MemoryRow copyWithCompanion(MemoriesCompanion data) {
    return MemoryRow(
      id: data.id.present ? data.id.value : this.id,
      type: data.type.present ? data.type.value : this.type,
      title: data.title.present ? data.title.value : this.title,
      value: data.value.present ? data.value.value : this.value,
      source: data.source.present ? data.source.value : this.source,
      confidence:
          data.confidence.present ? data.confidence.value : this.confidence,
      condition: data.condition.present ? data.condition.value : this.condition,
      expiresAt: data.expiresAt.present ? data.expiresAt.value : this.expiresAt,
      lastUsedAt:
          data.lastUsedAt.present ? data.lastUsedAt.value : this.lastUsedAt,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('MemoryRow(')
          ..write('id: $id, ')
          ..write('type: $type, ')
          ..write('title: $title, ')
          ..write('value: $value, ')
          ..write('source: $source, ')
          ..write('confidence: $confidence, ')
          ..write('condition: $condition, ')
          ..write('expiresAt: $expiresAt, ')
          ..write('lastUsedAt: $lastUsedAt, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, type, title, value, source, confidence,
      condition, expiresAt, lastUsedAt, createdAt, updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is MemoryRow &&
          other.id == this.id &&
          other.type == this.type &&
          other.title == this.title &&
          other.value == this.value &&
          other.source == this.source &&
          other.confidence == this.confidence &&
          other.condition == this.condition &&
          other.expiresAt == this.expiresAt &&
          other.lastUsedAt == this.lastUsedAt &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class MemoriesCompanion extends UpdateCompanion<MemoryRow> {
  final Value<String> id;
  final Value<String> type;
  final Value<String> title;
  final Value<String> value;
  final Value<String> source;
  final Value<String> confidence;
  final Value<String?> condition;
  final Value<DateTime?> expiresAt;
  final Value<DateTime?> lastUsedAt;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<int> rowid;
  const MemoriesCompanion({
    this.id = const Value.absent(),
    this.type = const Value.absent(),
    this.title = const Value.absent(),
    this.value = const Value.absent(),
    this.source = const Value.absent(),
    this.confidence = const Value.absent(),
    this.condition = const Value.absent(),
    this.expiresAt = const Value.absent(),
    this.lastUsedAt = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  MemoriesCompanion.insert({
    required String id,
    required String type,
    required String title,
    required String value,
    required String source,
    required String confidence,
    this.condition = const Value.absent(),
    this.expiresAt = const Value.absent(),
    this.lastUsedAt = const Value.absent(),
    required DateTime createdAt,
    required DateTime updatedAt,
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        type = Value(type),
        title = Value(title),
        value = Value(value),
        source = Value(source),
        confidence = Value(confidence),
        createdAt = Value(createdAt),
        updatedAt = Value(updatedAt);
  static Insertable<MemoryRow> custom({
    Expression<String>? id,
    Expression<String>? type,
    Expression<String>? title,
    Expression<String>? value,
    Expression<String>? source,
    Expression<String>? confidence,
    Expression<String>? condition,
    Expression<DateTime>? expiresAt,
    Expression<DateTime>? lastUsedAt,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (type != null) 'type': type,
      if (title != null) 'title': title,
      if (value != null) 'value': value,
      if (source != null) 'source': source,
      if (confidence != null) 'confidence': confidence,
      if (condition != null) 'condition': condition,
      if (expiresAt != null) 'expires_at': expiresAt,
      if (lastUsedAt != null) 'last_used_at': lastUsedAt,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  MemoriesCompanion copyWith(
      {Value<String>? id,
      Value<String>? type,
      Value<String>? title,
      Value<String>? value,
      Value<String>? source,
      Value<String>? confidence,
      Value<String?>? condition,
      Value<DateTime?>? expiresAt,
      Value<DateTime?>? lastUsedAt,
      Value<DateTime>? createdAt,
      Value<DateTime>? updatedAt,
      Value<int>? rowid}) {
    return MemoriesCompanion(
      id: id ?? this.id,
      type: type ?? this.type,
      title: title ?? this.title,
      value: value ?? this.value,
      source: source ?? this.source,
      confidence: confidence ?? this.confidence,
      condition: condition ?? this.condition,
      expiresAt: expiresAt ?? this.expiresAt,
      lastUsedAt: lastUsedAt ?? this.lastUsedAt,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (type.present) {
      map['type'] = Variable<String>(type.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (value.present) {
      map['value'] = Variable<String>(value.value);
    }
    if (source.present) {
      map['source'] = Variable<String>(source.value);
    }
    if (confidence.present) {
      map['confidence'] = Variable<String>(confidence.value);
    }
    if (condition.present) {
      map['condition'] = Variable<String>(condition.value);
    }
    if (expiresAt.present) {
      map['expires_at'] = Variable<DateTime>(expiresAt.value);
    }
    if (lastUsedAt.present) {
      map['last_used_at'] = Variable<DateTime>(lastUsedAt.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MemoriesCompanion(')
          ..write('id: $id, ')
          ..write('type: $type, ')
          ..write('title: $title, ')
          ..write('value: $value, ')
          ..write('source: $source, ')
          ..write('confidence: $confidence, ')
          ..write('condition: $condition, ')
          ..write('expiresAt: $expiresAt, ')
          ..write('lastUsedAt: $lastUsedAt, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $CalendarEventsTable extends CalendarEvents
    with TableInfo<$CalendarEventsTable, CalendarEventRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CalendarEventsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _startsAtMeta =
      const VerificationMeta('startsAt');
  @override
  late final GeneratedColumn<DateTime> startsAt = GeneratedColumn<DateTime>(
      'starts_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _endsAtMeta = const VerificationMeta('endsAt');
  @override
  late final GeneratedColumn<DateTime> endsAt = GeneratedColumn<DateTime>(
      'ends_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _locationNameMeta =
      const VerificationMeta('locationName');
  @override
  late final GeneratedColumn<String> locationName = GeneratedColumn<String>(
      'location_name', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns =>
      [id, title, startsAt, endsAt, locationName];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'calendar_events';
  @override
  VerificationContext validateIntegrity(Insertable<CalendarEventRow> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('starts_at')) {
      context.handle(_startsAtMeta,
          startsAt.isAcceptableOrUnknown(data['starts_at']!, _startsAtMeta));
    } else if (isInserting) {
      context.missing(_startsAtMeta);
    }
    if (data.containsKey('ends_at')) {
      context.handle(_endsAtMeta,
          endsAt.isAcceptableOrUnknown(data['ends_at']!, _endsAtMeta));
    } else if (isInserting) {
      context.missing(_endsAtMeta);
    }
    if (data.containsKey('location_name')) {
      context.handle(
          _locationNameMeta,
          locationName.isAcceptableOrUnknown(
              data['location_name']!, _locationNameMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CalendarEventRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CalendarEventRow(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      title: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}title'])!,
      startsAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}starts_at'])!,
      endsAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}ends_at'])!,
      locationName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}location_name']),
    );
  }

  @override
  $CalendarEventsTable createAlias(String alias) {
    return $CalendarEventsTable(attachedDatabase, alias);
  }
}

class CalendarEventRow extends DataClass
    implements Insertable<CalendarEventRow> {
  final String id;
  final String title;
  final DateTime startsAt;
  final DateTime endsAt;
  final String? locationName;
  const CalendarEventRow(
      {required this.id,
      required this.title,
      required this.startsAt,
      required this.endsAt,
      this.locationName});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['title'] = Variable<String>(title);
    map['starts_at'] = Variable<DateTime>(startsAt);
    map['ends_at'] = Variable<DateTime>(endsAt);
    if (!nullToAbsent || locationName != null) {
      map['location_name'] = Variable<String>(locationName);
    }
    return map;
  }

  CalendarEventsCompanion toCompanion(bool nullToAbsent) {
    return CalendarEventsCompanion(
      id: Value(id),
      title: Value(title),
      startsAt: Value(startsAt),
      endsAt: Value(endsAt),
      locationName: locationName == null && nullToAbsent
          ? const Value.absent()
          : Value(locationName),
    );
  }

  factory CalendarEventRow.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CalendarEventRow(
      id: serializer.fromJson<String>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      startsAt: serializer.fromJson<DateTime>(json['startsAt']),
      endsAt: serializer.fromJson<DateTime>(json['endsAt']),
      locationName: serializer.fromJson<String?>(json['locationName']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'title': serializer.toJson<String>(title),
      'startsAt': serializer.toJson<DateTime>(startsAt),
      'endsAt': serializer.toJson<DateTime>(endsAt),
      'locationName': serializer.toJson<String?>(locationName),
    };
  }

  CalendarEventRow copyWith(
          {String? id,
          String? title,
          DateTime? startsAt,
          DateTime? endsAt,
          Value<String?> locationName = const Value.absent()}) =>
      CalendarEventRow(
        id: id ?? this.id,
        title: title ?? this.title,
        startsAt: startsAt ?? this.startsAt,
        endsAt: endsAt ?? this.endsAt,
        locationName:
            locationName.present ? locationName.value : this.locationName,
      );
  CalendarEventRow copyWithCompanion(CalendarEventsCompanion data) {
    return CalendarEventRow(
      id: data.id.present ? data.id.value : this.id,
      title: data.title.present ? data.title.value : this.title,
      startsAt: data.startsAt.present ? data.startsAt.value : this.startsAt,
      endsAt: data.endsAt.present ? data.endsAt.value : this.endsAt,
      locationName: data.locationName.present
          ? data.locationName.value
          : this.locationName,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CalendarEventRow(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('startsAt: $startsAt, ')
          ..write('endsAt: $endsAt, ')
          ..write('locationName: $locationName')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, title, startsAt, endsAt, locationName);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CalendarEventRow &&
          other.id == this.id &&
          other.title == this.title &&
          other.startsAt == this.startsAt &&
          other.endsAt == this.endsAt &&
          other.locationName == this.locationName);
}

class CalendarEventsCompanion extends UpdateCompanion<CalendarEventRow> {
  final Value<String> id;
  final Value<String> title;
  final Value<DateTime> startsAt;
  final Value<DateTime> endsAt;
  final Value<String?> locationName;
  final Value<int> rowid;
  const CalendarEventsCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.startsAt = const Value.absent(),
    this.endsAt = const Value.absent(),
    this.locationName = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  CalendarEventsCompanion.insert({
    required String id,
    required String title,
    required DateTime startsAt,
    required DateTime endsAt,
    this.locationName = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        title = Value(title),
        startsAt = Value(startsAt),
        endsAt = Value(endsAt);
  static Insertable<CalendarEventRow> custom({
    Expression<String>? id,
    Expression<String>? title,
    Expression<DateTime>? startsAt,
    Expression<DateTime>? endsAt,
    Expression<String>? locationName,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (startsAt != null) 'starts_at': startsAt,
      if (endsAt != null) 'ends_at': endsAt,
      if (locationName != null) 'location_name': locationName,
      if (rowid != null) 'rowid': rowid,
    });
  }

  CalendarEventsCompanion copyWith(
      {Value<String>? id,
      Value<String>? title,
      Value<DateTime>? startsAt,
      Value<DateTime>? endsAt,
      Value<String?>? locationName,
      Value<int>? rowid}) {
    return CalendarEventsCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      startsAt: startsAt ?? this.startsAt,
      endsAt: endsAt ?? this.endsAt,
      locationName: locationName ?? this.locationName,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (startsAt.present) {
      map['starts_at'] = Variable<DateTime>(startsAt.value);
    }
    if (endsAt.present) {
      map['ends_at'] = Variable<DateTime>(endsAt.value);
    }
    if (locationName.present) {
      map['location_name'] = Variable<String>(locationName.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CalendarEventsCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('startsAt: $startsAt, ')
          ..write('endsAt: $endsAt, ')
          ..write('locationName: $locationName, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $PlansTable extends Plans with TableInfo<$PlansTable, PlanRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PlansTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<DateTime> date = GeneratedColumn<DateTime>(
      'date', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _evidenceIdsMeta =
      const VerificationMeta('evidenceIds');
  @override
  late final GeneratedColumn<String> evidenceIds = GeneratedColumn<String>(
      'evidence_ids', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, date, evidenceIds, createdAt, updatedAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'plans';
  @override
  VerificationContext validateIntegrity(Insertable<PlanRow> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('date')) {
      context.handle(
          _dateMeta, date.isAcceptableOrUnknown(data['date']!, _dateMeta));
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    if (data.containsKey('evidence_ids')) {
      context.handle(
          _evidenceIdsMeta,
          evidenceIds.isAcceptableOrUnknown(
              data['evidence_ids']!, _evidenceIdsMeta));
    } else if (isInserting) {
      context.missing(_evidenceIdsMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  PlanRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PlanRow(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      date: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}date'])!,
      evidenceIds: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}evidence_ids'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
    );
  }

  @override
  $PlansTable createAlias(String alias) {
    return $PlansTable(attachedDatabase, alias);
  }
}

class PlanRow extends DataClass implements Insertable<PlanRow> {
  final String id;
  final DateTime date;
  final String evidenceIds;
  final DateTime createdAt;
  final DateTime updatedAt;
  const PlanRow(
      {required this.id,
      required this.date,
      required this.evidenceIds,
      required this.createdAt,
      required this.updatedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['date'] = Variable<DateTime>(date);
    map['evidence_ids'] = Variable<String>(evidenceIds);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  PlansCompanion toCompanion(bool nullToAbsent) {
    return PlansCompanion(
      id: Value(id),
      date: Value(date),
      evidenceIds: Value(evidenceIds),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory PlanRow.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PlanRow(
      id: serializer.fromJson<String>(json['id']),
      date: serializer.fromJson<DateTime>(json['date']),
      evidenceIds: serializer.fromJson<String>(json['evidenceIds']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'date': serializer.toJson<DateTime>(date),
      'evidenceIds': serializer.toJson<String>(evidenceIds),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  PlanRow copyWith(
          {String? id,
          DateTime? date,
          String? evidenceIds,
          DateTime? createdAt,
          DateTime? updatedAt}) =>
      PlanRow(
        id: id ?? this.id,
        date: date ?? this.date,
        evidenceIds: evidenceIds ?? this.evidenceIds,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );
  PlanRow copyWithCompanion(PlansCompanion data) {
    return PlanRow(
      id: data.id.present ? data.id.value : this.id,
      date: data.date.present ? data.date.value : this.date,
      evidenceIds:
          data.evidenceIds.present ? data.evidenceIds.value : this.evidenceIds,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('PlanRow(')
          ..write('id: $id, ')
          ..write('date: $date, ')
          ..write('evidenceIds: $evidenceIds, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, date, evidenceIds, createdAt, updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PlanRow &&
          other.id == this.id &&
          other.date == this.date &&
          other.evidenceIds == this.evidenceIds &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class PlansCompanion extends UpdateCompanion<PlanRow> {
  final Value<String> id;
  final Value<DateTime> date;
  final Value<String> evidenceIds;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<int> rowid;
  const PlansCompanion({
    this.id = const Value.absent(),
    this.date = const Value.absent(),
    this.evidenceIds = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  PlansCompanion.insert({
    required String id,
    required DateTime date,
    required String evidenceIds,
    required DateTime createdAt,
    required DateTime updatedAt,
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        date = Value(date),
        evidenceIds = Value(evidenceIds),
        createdAt = Value(createdAt),
        updatedAt = Value(updatedAt);
  static Insertable<PlanRow> custom({
    Expression<String>? id,
    Expression<DateTime>? date,
    Expression<String>? evidenceIds,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (date != null) 'date': date,
      if (evidenceIds != null) 'evidence_ids': evidenceIds,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  PlansCompanion copyWith(
      {Value<String>? id,
      Value<DateTime>? date,
      Value<String>? evidenceIds,
      Value<DateTime>? createdAt,
      Value<DateTime>? updatedAt,
      Value<int>? rowid}) {
    return PlansCompanion(
      id: id ?? this.id,
      date: date ?? this.date,
      evidenceIds: evidenceIds ?? this.evidenceIds,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (date.present) {
      map['date'] = Variable<DateTime>(date.value);
    }
    if (evidenceIds.present) {
      map['evidence_ids'] = Variable<String>(evidenceIds.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PlansCompanion(')
          ..write('id: $id, ')
          ..write('date: $date, ')
          ..write('evidenceIds: $evidenceIds, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $PlanBlocksTable extends PlanBlocks
    with TableInfo<$PlanBlocksTable, PlanBlockRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PlanBlocksTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _planIdMeta = const VerificationMeta('planId');
  @override
  late final GeneratedColumn<String> planId = GeneratedColumn<String>(
      'plan_id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES plans (id)'));
  static const VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumn<String> type = GeneratedColumn<String>(
      'type', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _startsAtMeta =
      const VerificationMeta('startsAt');
  @override
  late final GeneratedColumn<DateTime> startsAt = GeneratedColumn<DateTime>(
      'starts_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _endsAtMeta = const VerificationMeta('endsAt');
  @override
  late final GeneratedColumn<DateTime> endsAt = GeneratedColumn<DateTime>(
      'ends_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _evidenceIdsMeta =
      const VerificationMeta('evidenceIds');
  @override
  late final GeneratedColumn<String> evidenceIds = GeneratedColumn<String>(
      'evidence_ids', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, planId, type, title, startsAt, endsAt, evidenceIds];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'plan_blocks';
  @override
  VerificationContext validateIntegrity(Insertable<PlanBlockRow> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('plan_id')) {
      context.handle(_planIdMeta,
          planId.isAcceptableOrUnknown(data['plan_id']!, _planIdMeta));
    } else if (isInserting) {
      context.missing(_planIdMeta);
    }
    if (data.containsKey('type')) {
      context.handle(
          _typeMeta, type.isAcceptableOrUnknown(data['type']!, _typeMeta));
    } else if (isInserting) {
      context.missing(_typeMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('starts_at')) {
      context.handle(_startsAtMeta,
          startsAt.isAcceptableOrUnknown(data['starts_at']!, _startsAtMeta));
    } else if (isInserting) {
      context.missing(_startsAtMeta);
    }
    if (data.containsKey('ends_at')) {
      context.handle(_endsAtMeta,
          endsAt.isAcceptableOrUnknown(data['ends_at']!, _endsAtMeta));
    } else if (isInserting) {
      context.missing(_endsAtMeta);
    }
    if (data.containsKey('evidence_ids')) {
      context.handle(
          _evidenceIdsMeta,
          evidenceIds.isAcceptableOrUnknown(
              data['evidence_ids']!, _evidenceIdsMeta));
    } else if (isInserting) {
      context.missing(_evidenceIdsMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  PlanBlockRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PlanBlockRow(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      planId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}plan_id'])!,
      type: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}type'])!,
      title: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}title'])!,
      startsAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}starts_at'])!,
      endsAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}ends_at'])!,
      evidenceIds: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}evidence_ids'])!,
    );
  }

  @override
  $PlanBlocksTable createAlias(String alias) {
    return $PlanBlocksTable(attachedDatabase, alias);
  }
}

class PlanBlockRow extends DataClass implements Insertable<PlanBlockRow> {
  final String id;
  final String planId;
  final String type;
  final String title;
  final DateTime startsAt;
  final DateTime endsAt;
  final String evidenceIds;
  const PlanBlockRow(
      {required this.id,
      required this.planId,
      required this.type,
      required this.title,
      required this.startsAt,
      required this.endsAt,
      required this.evidenceIds});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['plan_id'] = Variable<String>(planId);
    map['type'] = Variable<String>(type);
    map['title'] = Variable<String>(title);
    map['starts_at'] = Variable<DateTime>(startsAt);
    map['ends_at'] = Variable<DateTime>(endsAt);
    map['evidence_ids'] = Variable<String>(evidenceIds);
    return map;
  }

  PlanBlocksCompanion toCompanion(bool nullToAbsent) {
    return PlanBlocksCompanion(
      id: Value(id),
      planId: Value(planId),
      type: Value(type),
      title: Value(title),
      startsAt: Value(startsAt),
      endsAt: Value(endsAt),
      evidenceIds: Value(evidenceIds),
    );
  }

  factory PlanBlockRow.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PlanBlockRow(
      id: serializer.fromJson<String>(json['id']),
      planId: serializer.fromJson<String>(json['planId']),
      type: serializer.fromJson<String>(json['type']),
      title: serializer.fromJson<String>(json['title']),
      startsAt: serializer.fromJson<DateTime>(json['startsAt']),
      endsAt: serializer.fromJson<DateTime>(json['endsAt']),
      evidenceIds: serializer.fromJson<String>(json['evidenceIds']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'planId': serializer.toJson<String>(planId),
      'type': serializer.toJson<String>(type),
      'title': serializer.toJson<String>(title),
      'startsAt': serializer.toJson<DateTime>(startsAt),
      'endsAt': serializer.toJson<DateTime>(endsAt),
      'evidenceIds': serializer.toJson<String>(evidenceIds),
    };
  }

  PlanBlockRow copyWith(
          {String? id,
          String? planId,
          String? type,
          String? title,
          DateTime? startsAt,
          DateTime? endsAt,
          String? evidenceIds}) =>
      PlanBlockRow(
        id: id ?? this.id,
        planId: planId ?? this.planId,
        type: type ?? this.type,
        title: title ?? this.title,
        startsAt: startsAt ?? this.startsAt,
        endsAt: endsAt ?? this.endsAt,
        evidenceIds: evidenceIds ?? this.evidenceIds,
      );
  PlanBlockRow copyWithCompanion(PlanBlocksCompanion data) {
    return PlanBlockRow(
      id: data.id.present ? data.id.value : this.id,
      planId: data.planId.present ? data.planId.value : this.planId,
      type: data.type.present ? data.type.value : this.type,
      title: data.title.present ? data.title.value : this.title,
      startsAt: data.startsAt.present ? data.startsAt.value : this.startsAt,
      endsAt: data.endsAt.present ? data.endsAt.value : this.endsAt,
      evidenceIds:
          data.evidenceIds.present ? data.evidenceIds.value : this.evidenceIds,
    );
  }

  @override
  String toString() {
    return (StringBuffer('PlanBlockRow(')
          ..write('id: $id, ')
          ..write('planId: $planId, ')
          ..write('type: $type, ')
          ..write('title: $title, ')
          ..write('startsAt: $startsAt, ')
          ..write('endsAt: $endsAt, ')
          ..write('evidenceIds: $evidenceIds')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, planId, type, title, startsAt, endsAt, evidenceIds);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PlanBlockRow &&
          other.id == this.id &&
          other.planId == this.planId &&
          other.type == this.type &&
          other.title == this.title &&
          other.startsAt == this.startsAt &&
          other.endsAt == this.endsAt &&
          other.evidenceIds == this.evidenceIds);
}

class PlanBlocksCompanion extends UpdateCompanion<PlanBlockRow> {
  final Value<String> id;
  final Value<String> planId;
  final Value<String> type;
  final Value<String> title;
  final Value<DateTime> startsAt;
  final Value<DateTime> endsAt;
  final Value<String> evidenceIds;
  final Value<int> rowid;
  const PlanBlocksCompanion({
    this.id = const Value.absent(),
    this.planId = const Value.absent(),
    this.type = const Value.absent(),
    this.title = const Value.absent(),
    this.startsAt = const Value.absent(),
    this.endsAt = const Value.absent(),
    this.evidenceIds = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  PlanBlocksCompanion.insert({
    required String id,
    required String planId,
    required String type,
    required String title,
    required DateTime startsAt,
    required DateTime endsAt,
    required String evidenceIds,
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        planId = Value(planId),
        type = Value(type),
        title = Value(title),
        startsAt = Value(startsAt),
        endsAt = Value(endsAt),
        evidenceIds = Value(evidenceIds);
  static Insertable<PlanBlockRow> custom({
    Expression<String>? id,
    Expression<String>? planId,
    Expression<String>? type,
    Expression<String>? title,
    Expression<DateTime>? startsAt,
    Expression<DateTime>? endsAt,
    Expression<String>? evidenceIds,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (planId != null) 'plan_id': planId,
      if (type != null) 'type': type,
      if (title != null) 'title': title,
      if (startsAt != null) 'starts_at': startsAt,
      if (endsAt != null) 'ends_at': endsAt,
      if (evidenceIds != null) 'evidence_ids': evidenceIds,
      if (rowid != null) 'rowid': rowid,
    });
  }

  PlanBlocksCompanion copyWith(
      {Value<String>? id,
      Value<String>? planId,
      Value<String>? type,
      Value<String>? title,
      Value<DateTime>? startsAt,
      Value<DateTime>? endsAt,
      Value<String>? evidenceIds,
      Value<int>? rowid}) {
    return PlanBlocksCompanion(
      id: id ?? this.id,
      planId: planId ?? this.planId,
      type: type ?? this.type,
      title: title ?? this.title,
      startsAt: startsAt ?? this.startsAt,
      endsAt: endsAt ?? this.endsAt,
      evidenceIds: evidenceIds ?? this.evidenceIds,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (planId.present) {
      map['plan_id'] = Variable<String>(planId.value);
    }
    if (type.present) {
      map['type'] = Variable<String>(type.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (startsAt.present) {
      map['starts_at'] = Variable<DateTime>(startsAt.value);
    }
    if (endsAt.present) {
      map['ends_at'] = Variable<DateTime>(endsAt.value);
    }
    if (evidenceIds.present) {
      map['evidence_ids'] = Variable<String>(evidenceIds.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PlanBlocksCompanion(')
          ..write('id: $id, ')
          ..write('planId: $planId, ')
          ..write('type: $type, ')
          ..write('title: $title, ')
          ..write('startsAt: $startsAt, ')
          ..write('endsAt: $endsAt, ')
          ..write('evidenceIds: $evidenceIds, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $AlarmsTable extends Alarms with TableInfo<$AlarmsTable, AlarmRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AlarmsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _scheduledForMeta =
      const VerificationMeta('scheduledFor');
  @override
  late final GeneratedColumn<DateTime> scheduledFor = GeneratedColumn<DateTime>(
      'scheduled_for', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _reasonMeta = const VerificationMeta('reason');
  @override
  late final GeneratedColumn<String> reason = GeneratedColumn<String>(
      'reason', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _evidenceIdsMeta =
      const VerificationMeta('evidenceIds');
  @override
  late final GeneratedColumn<String> evidenceIds = GeneratedColumn<String>(
      'evidence_ids', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _calculationVersionMeta =
      const VerificationMeta('calculationVersion');
  @override
  late final GeneratedColumn<int> calculationVersion = GeneratedColumn<int>(
      'calculation_version', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _isActiveMeta =
      const VerificationMeta('isActive');
  @override
  late final GeneratedColumn<bool> isActive = GeneratedColumn<bool>(
      'is_active', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_active" IN (0, 1))'));
  @override
  List<GeneratedColumn> get $columns =>
      [id, scheduledFor, reason, evidenceIds, calculationVersion, isActive];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'alarms';
  @override
  VerificationContext validateIntegrity(Insertable<AlarmRow> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('scheduled_for')) {
      context.handle(
          _scheduledForMeta,
          scheduledFor.isAcceptableOrUnknown(
              data['scheduled_for']!, _scheduledForMeta));
    } else if (isInserting) {
      context.missing(_scheduledForMeta);
    }
    if (data.containsKey('reason')) {
      context.handle(_reasonMeta,
          reason.isAcceptableOrUnknown(data['reason']!, _reasonMeta));
    } else if (isInserting) {
      context.missing(_reasonMeta);
    }
    if (data.containsKey('evidence_ids')) {
      context.handle(
          _evidenceIdsMeta,
          evidenceIds.isAcceptableOrUnknown(
              data['evidence_ids']!, _evidenceIdsMeta));
    } else if (isInserting) {
      context.missing(_evidenceIdsMeta);
    }
    if (data.containsKey('calculation_version')) {
      context.handle(
          _calculationVersionMeta,
          calculationVersion.isAcceptableOrUnknown(
              data['calculation_version']!, _calculationVersionMeta));
    } else if (isInserting) {
      context.missing(_calculationVersionMeta);
    }
    if (data.containsKey('is_active')) {
      context.handle(_isActiveMeta,
          isActive.isAcceptableOrUnknown(data['is_active']!, _isActiveMeta));
    } else if (isInserting) {
      context.missing(_isActiveMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  AlarmRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return AlarmRow(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      scheduledFor: attachedDatabase.typeMapping.read(
          DriftSqlType.dateTime, data['${effectivePrefix}scheduled_for'])!,
      reason: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}reason'])!,
      evidenceIds: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}evidence_ids'])!,
      calculationVersion: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}calculation_version'])!,
      isActive: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_active'])!,
    );
  }

  @override
  $AlarmsTable createAlias(String alias) {
    return $AlarmsTable(attachedDatabase, alias);
  }
}

class AlarmRow extends DataClass implements Insertable<AlarmRow> {
  final String id;
  final DateTime scheduledFor;
  final String reason;
  final String evidenceIds;
  final int calculationVersion;
  final bool isActive;
  const AlarmRow(
      {required this.id,
      required this.scheduledFor,
      required this.reason,
      required this.evidenceIds,
      required this.calculationVersion,
      required this.isActive});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['scheduled_for'] = Variable<DateTime>(scheduledFor);
    map['reason'] = Variable<String>(reason);
    map['evidence_ids'] = Variable<String>(evidenceIds);
    map['calculation_version'] = Variable<int>(calculationVersion);
    map['is_active'] = Variable<bool>(isActive);
    return map;
  }

  AlarmsCompanion toCompanion(bool nullToAbsent) {
    return AlarmsCompanion(
      id: Value(id),
      scheduledFor: Value(scheduledFor),
      reason: Value(reason),
      evidenceIds: Value(evidenceIds),
      calculationVersion: Value(calculationVersion),
      isActive: Value(isActive),
    );
  }

  factory AlarmRow.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return AlarmRow(
      id: serializer.fromJson<String>(json['id']),
      scheduledFor: serializer.fromJson<DateTime>(json['scheduledFor']),
      reason: serializer.fromJson<String>(json['reason']),
      evidenceIds: serializer.fromJson<String>(json['evidenceIds']),
      calculationVersion: serializer.fromJson<int>(json['calculationVersion']),
      isActive: serializer.fromJson<bool>(json['isActive']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'scheduledFor': serializer.toJson<DateTime>(scheduledFor),
      'reason': serializer.toJson<String>(reason),
      'evidenceIds': serializer.toJson<String>(evidenceIds),
      'calculationVersion': serializer.toJson<int>(calculationVersion),
      'isActive': serializer.toJson<bool>(isActive),
    };
  }

  AlarmRow copyWith(
          {String? id,
          DateTime? scheduledFor,
          String? reason,
          String? evidenceIds,
          int? calculationVersion,
          bool? isActive}) =>
      AlarmRow(
        id: id ?? this.id,
        scheduledFor: scheduledFor ?? this.scheduledFor,
        reason: reason ?? this.reason,
        evidenceIds: evidenceIds ?? this.evidenceIds,
        calculationVersion: calculationVersion ?? this.calculationVersion,
        isActive: isActive ?? this.isActive,
      );
  AlarmRow copyWithCompanion(AlarmsCompanion data) {
    return AlarmRow(
      id: data.id.present ? data.id.value : this.id,
      scheduledFor: data.scheduledFor.present
          ? data.scheduledFor.value
          : this.scheduledFor,
      reason: data.reason.present ? data.reason.value : this.reason,
      evidenceIds:
          data.evidenceIds.present ? data.evidenceIds.value : this.evidenceIds,
      calculationVersion: data.calculationVersion.present
          ? data.calculationVersion.value
          : this.calculationVersion,
      isActive: data.isActive.present ? data.isActive.value : this.isActive,
    );
  }

  @override
  String toString() {
    return (StringBuffer('AlarmRow(')
          ..write('id: $id, ')
          ..write('scheduledFor: $scheduledFor, ')
          ..write('reason: $reason, ')
          ..write('evidenceIds: $evidenceIds, ')
          ..write('calculationVersion: $calculationVersion, ')
          ..write('isActive: $isActive')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id, scheduledFor, reason, evidenceIds, calculationVersion, isActive);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AlarmRow &&
          other.id == this.id &&
          other.scheduledFor == this.scheduledFor &&
          other.reason == this.reason &&
          other.evidenceIds == this.evidenceIds &&
          other.calculationVersion == this.calculationVersion &&
          other.isActive == this.isActive);
}

class AlarmsCompanion extends UpdateCompanion<AlarmRow> {
  final Value<String> id;
  final Value<DateTime> scheduledFor;
  final Value<String> reason;
  final Value<String> evidenceIds;
  final Value<int> calculationVersion;
  final Value<bool> isActive;
  final Value<int> rowid;
  const AlarmsCompanion({
    this.id = const Value.absent(),
    this.scheduledFor = const Value.absent(),
    this.reason = const Value.absent(),
    this.evidenceIds = const Value.absent(),
    this.calculationVersion = const Value.absent(),
    this.isActive = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  AlarmsCompanion.insert({
    required String id,
    required DateTime scheduledFor,
    required String reason,
    required String evidenceIds,
    required int calculationVersion,
    required bool isActive,
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        scheduledFor = Value(scheduledFor),
        reason = Value(reason),
        evidenceIds = Value(evidenceIds),
        calculationVersion = Value(calculationVersion),
        isActive = Value(isActive);
  static Insertable<AlarmRow> custom({
    Expression<String>? id,
    Expression<DateTime>? scheduledFor,
    Expression<String>? reason,
    Expression<String>? evidenceIds,
    Expression<int>? calculationVersion,
    Expression<bool>? isActive,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (scheduledFor != null) 'scheduled_for': scheduledFor,
      if (reason != null) 'reason': reason,
      if (evidenceIds != null) 'evidence_ids': evidenceIds,
      if (calculationVersion != null) 'calculation_version': calculationVersion,
      if (isActive != null) 'is_active': isActive,
      if (rowid != null) 'rowid': rowid,
    });
  }

  AlarmsCompanion copyWith(
      {Value<String>? id,
      Value<DateTime>? scheduledFor,
      Value<String>? reason,
      Value<String>? evidenceIds,
      Value<int>? calculationVersion,
      Value<bool>? isActive,
      Value<int>? rowid}) {
    return AlarmsCompanion(
      id: id ?? this.id,
      scheduledFor: scheduledFor ?? this.scheduledFor,
      reason: reason ?? this.reason,
      evidenceIds: evidenceIds ?? this.evidenceIds,
      calculationVersion: calculationVersion ?? this.calculationVersion,
      isActive: isActive ?? this.isActive,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (scheduledFor.present) {
      map['scheduled_for'] = Variable<DateTime>(scheduledFor.value);
    }
    if (reason.present) {
      map['reason'] = Variable<String>(reason.value);
    }
    if (evidenceIds.present) {
      map['evidence_ids'] = Variable<String>(evidenceIds.value);
    }
    if (calculationVersion.present) {
      map['calculation_version'] = Variable<int>(calculationVersion.value);
    }
    if (isActive.present) {
      map['is_active'] = Variable<bool>(isActive.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AlarmsCompanion(')
          ..write('id: $id, ')
          ..write('scheduledFor: $scheduledFor, ')
          ..write('reason: $reason, ')
          ..write('evidenceIds: $evidenceIds, ')
          ..write('calculationVersion: $calculationVersion, ')
          ..write('isActive: $isActive, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $NotificationRowsTable extends NotificationRows
    with TableInfo<$NotificationRowsTable, NotificationRecord> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $NotificationRowsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _fingerprintMeta =
      const VerificationMeta('fingerprint');
  @override
  late final GeneratedColumn<String> fingerprint = GeneratedColumn<String>(
      'fingerprint', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _priorityMeta =
      const VerificationMeta('priority');
  @override
  late final GeneratedColumn<String> priority = GeneratedColumn<String>(
      'priority', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _bodyMeta = const VerificationMeta('body');
  @override
  late final GeneratedColumn<String> body = GeneratedColumn<String>(
      'body', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _evidenceIdsMeta =
      const VerificationMeta('evidenceIds');
  @override
  late final GeneratedColumn<String> evidenceIds = GeneratedColumn<String>(
      'evidence_ids', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, fingerprint, priority, title, body, createdAt, evidenceIds];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'notification_rows';
  @override
  VerificationContext validateIntegrity(Insertable<NotificationRecord> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('fingerprint')) {
      context.handle(
          _fingerprintMeta,
          fingerprint.isAcceptableOrUnknown(
              data['fingerprint']!, _fingerprintMeta));
    } else if (isInserting) {
      context.missing(_fingerprintMeta);
    }
    if (data.containsKey('priority')) {
      context.handle(_priorityMeta,
          priority.isAcceptableOrUnknown(data['priority']!, _priorityMeta));
    } else if (isInserting) {
      context.missing(_priorityMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('body')) {
      context.handle(
          _bodyMeta, body.isAcceptableOrUnknown(data['body']!, _bodyMeta));
    } else if (isInserting) {
      context.missing(_bodyMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('evidence_ids')) {
      context.handle(
          _evidenceIdsMeta,
          evidenceIds.isAcceptableOrUnknown(
              data['evidence_ids']!, _evidenceIdsMeta));
    } else if (isInserting) {
      context.missing(_evidenceIdsMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  NotificationRecord map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return NotificationRecord(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      fingerprint: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}fingerprint'])!,
      priority: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}priority'])!,
      title: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}title'])!,
      body: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}body'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      evidenceIds: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}evidence_ids'])!,
    );
  }

  @override
  $NotificationRowsTable createAlias(String alias) {
    return $NotificationRowsTable(attachedDatabase, alias);
  }
}

class NotificationRecord extends DataClass
    implements Insertable<NotificationRecord> {
  final String id;
  final String fingerprint;
  final String priority;
  final String title;
  final String body;
  final DateTime createdAt;
  final String evidenceIds;
  const NotificationRecord(
      {required this.id,
      required this.fingerprint,
      required this.priority,
      required this.title,
      required this.body,
      required this.createdAt,
      required this.evidenceIds});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['fingerprint'] = Variable<String>(fingerprint);
    map['priority'] = Variable<String>(priority);
    map['title'] = Variable<String>(title);
    map['body'] = Variable<String>(body);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['evidence_ids'] = Variable<String>(evidenceIds);
    return map;
  }

  NotificationRowsCompanion toCompanion(bool nullToAbsent) {
    return NotificationRowsCompanion(
      id: Value(id),
      fingerprint: Value(fingerprint),
      priority: Value(priority),
      title: Value(title),
      body: Value(body),
      createdAt: Value(createdAt),
      evidenceIds: Value(evidenceIds),
    );
  }

  factory NotificationRecord.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return NotificationRecord(
      id: serializer.fromJson<String>(json['id']),
      fingerprint: serializer.fromJson<String>(json['fingerprint']),
      priority: serializer.fromJson<String>(json['priority']),
      title: serializer.fromJson<String>(json['title']),
      body: serializer.fromJson<String>(json['body']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      evidenceIds: serializer.fromJson<String>(json['evidenceIds']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'fingerprint': serializer.toJson<String>(fingerprint),
      'priority': serializer.toJson<String>(priority),
      'title': serializer.toJson<String>(title),
      'body': serializer.toJson<String>(body),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'evidenceIds': serializer.toJson<String>(evidenceIds),
    };
  }

  NotificationRecord copyWith(
          {String? id,
          String? fingerprint,
          String? priority,
          String? title,
          String? body,
          DateTime? createdAt,
          String? evidenceIds}) =>
      NotificationRecord(
        id: id ?? this.id,
        fingerprint: fingerprint ?? this.fingerprint,
        priority: priority ?? this.priority,
        title: title ?? this.title,
        body: body ?? this.body,
        createdAt: createdAt ?? this.createdAt,
        evidenceIds: evidenceIds ?? this.evidenceIds,
      );
  NotificationRecord copyWithCompanion(NotificationRowsCompanion data) {
    return NotificationRecord(
      id: data.id.present ? data.id.value : this.id,
      fingerprint:
          data.fingerprint.present ? data.fingerprint.value : this.fingerprint,
      priority: data.priority.present ? data.priority.value : this.priority,
      title: data.title.present ? data.title.value : this.title,
      body: data.body.present ? data.body.value : this.body,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      evidenceIds:
          data.evidenceIds.present ? data.evidenceIds.value : this.evidenceIds,
    );
  }

  @override
  String toString() {
    return (StringBuffer('NotificationRecord(')
          ..write('id: $id, ')
          ..write('fingerprint: $fingerprint, ')
          ..write('priority: $priority, ')
          ..write('title: $title, ')
          ..write('body: $body, ')
          ..write('createdAt: $createdAt, ')
          ..write('evidenceIds: $evidenceIds')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id, fingerprint, priority, title, body, createdAt, evidenceIds);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is NotificationRecord &&
          other.id == this.id &&
          other.fingerprint == this.fingerprint &&
          other.priority == this.priority &&
          other.title == this.title &&
          other.body == this.body &&
          other.createdAt == this.createdAt &&
          other.evidenceIds == this.evidenceIds);
}

class NotificationRowsCompanion extends UpdateCompanion<NotificationRecord> {
  final Value<String> id;
  final Value<String> fingerprint;
  final Value<String> priority;
  final Value<String> title;
  final Value<String> body;
  final Value<DateTime> createdAt;
  final Value<String> evidenceIds;
  final Value<int> rowid;
  const NotificationRowsCompanion({
    this.id = const Value.absent(),
    this.fingerprint = const Value.absent(),
    this.priority = const Value.absent(),
    this.title = const Value.absent(),
    this.body = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.evidenceIds = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  NotificationRowsCompanion.insert({
    required String id,
    required String fingerprint,
    required String priority,
    required String title,
    required String body,
    required DateTime createdAt,
    required String evidenceIds,
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        fingerprint = Value(fingerprint),
        priority = Value(priority),
        title = Value(title),
        body = Value(body),
        createdAt = Value(createdAt),
        evidenceIds = Value(evidenceIds);
  static Insertable<NotificationRecord> custom({
    Expression<String>? id,
    Expression<String>? fingerprint,
    Expression<String>? priority,
    Expression<String>? title,
    Expression<String>? body,
    Expression<DateTime>? createdAt,
    Expression<String>? evidenceIds,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (fingerprint != null) 'fingerprint': fingerprint,
      if (priority != null) 'priority': priority,
      if (title != null) 'title': title,
      if (body != null) 'body': body,
      if (createdAt != null) 'created_at': createdAt,
      if (evidenceIds != null) 'evidence_ids': evidenceIds,
      if (rowid != null) 'rowid': rowid,
    });
  }

  NotificationRowsCompanion copyWith(
      {Value<String>? id,
      Value<String>? fingerprint,
      Value<String>? priority,
      Value<String>? title,
      Value<String>? body,
      Value<DateTime>? createdAt,
      Value<String>? evidenceIds,
      Value<int>? rowid}) {
    return NotificationRowsCompanion(
      id: id ?? this.id,
      fingerprint: fingerprint ?? this.fingerprint,
      priority: priority ?? this.priority,
      title: title ?? this.title,
      body: body ?? this.body,
      createdAt: createdAt ?? this.createdAt,
      evidenceIds: evidenceIds ?? this.evidenceIds,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (fingerprint.present) {
      map['fingerprint'] = Variable<String>(fingerprint.value);
    }
    if (priority.present) {
      map['priority'] = Variable<String>(priority.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (body.present) {
      map['body'] = Variable<String>(body.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (evidenceIds.present) {
      map['evidence_ids'] = Variable<String>(evidenceIds.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('NotificationRowsCompanion(')
          ..write('id: $id, ')
          ..write('fingerprint: $fingerprint, ')
          ..write('priority: $priority, ')
          ..write('title: $title, ')
          ..write('body: $body, ')
          ..write('createdAt: $createdAt, ')
          ..write('evidenceIds: $evidenceIds, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $ReminderRowsTable extends ReminderRows
    with TableInfo<$ReminderRowsTable, ReminderRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ReminderRowsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _keyMeta = const VerificationMeta('key');
  @override
  late final GeneratedColumn<String> key = GeneratedColumn<String>(
      'key', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _notificationIdMeta =
      const VerificationMeta('notificationId');
  @override
  late final GeneratedColumn<int> notificationId = GeneratedColumn<int>(
      'notification_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _ownerIdMeta =
      const VerificationMeta('ownerId');
  @override
  late final GeneratedColumn<String> ownerId = GeneratedColumn<String>(
      'owner_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _kindMeta = const VerificationMeta('kind');
  @override
  late final GeneratedColumn<String> kind = GeneratedColumn<String>(
      'kind', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _scheduledForMeta =
      const VerificationMeta('scheduledFor');
  @override
  late final GeneratedColumn<DateTime> scheduledFor = GeneratedColumn<DateTime>(
      'scheduled_for', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _bodyMeta = const VerificationMeta('body');
  @override
  late final GeneratedColumn<String> body = GeneratedColumn<String>(
      'body', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _evidenceMeta =
      const VerificationMeta('evidence');
  @override
  late final GeneratedColumn<String> evidence = GeneratedColumn<String>(
      'evidence', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _evidenceIdsMeta =
      const VerificationMeta('evidenceIds');
  @override
  late final GeneratedColumn<String> evidenceIds = GeneratedColumn<String>(
      'evidence_ids', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
      'status', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        key,
        notificationId,
        ownerId,
        kind,
        scheduledFor,
        title,
        body,
        evidence,
        evidenceIds,
        status,
        updatedAt
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'reminder_rows';
  @override
  VerificationContext validateIntegrity(Insertable<ReminderRow> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('key')) {
      context.handle(
          _keyMeta, key.isAcceptableOrUnknown(data['key']!, _keyMeta));
    } else if (isInserting) {
      context.missing(_keyMeta);
    }
    if (data.containsKey('notification_id')) {
      context.handle(
          _notificationIdMeta,
          notificationId.isAcceptableOrUnknown(
              data['notification_id']!, _notificationIdMeta));
    } else if (isInserting) {
      context.missing(_notificationIdMeta);
    }
    if (data.containsKey('owner_id')) {
      context.handle(_ownerIdMeta,
          ownerId.isAcceptableOrUnknown(data['owner_id']!, _ownerIdMeta));
    } else if (isInserting) {
      context.missing(_ownerIdMeta);
    }
    if (data.containsKey('kind')) {
      context.handle(
          _kindMeta, kind.isAcceptableOrUnknown(data['kind']!, _kindMeta));
    } else if (isInserting) {
      context.missing(_kindMeta);
    }
    if (data.containsKey('scheduled_for')) {
      context.handle(
          _scheduledForMeta,
          scheduledFor.isAcceptableOrUnknown(
              data['scheduled_for']!, _scheduledForMeta));
    } else if (isInserting) {
      context.missing(_scheduledForMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('body')) {
      context.handle(
          _bodyMeta, body.isAcceptableOrUnknown(data['body']!, _bodyMeta));
    } else if (isInserting) {
      context.missing(_bodyMeta);
    }
    if (data.containsKey('evidence')) {
      context.handle(_evidenceMeta,
          evidence.isAcceptableOrUnknown(data['evidence']!, _evidenceMeta));
    } else if (isInserting) {
      context.missing(_evidenceMeta);
    }
    if (data.containsKey('evidence_ids')) {
      context.handle(
          _evidenceIdsMeta,
          evidenceIds.isAcceptableOrUnknown(
              data['evidence_ids']!, _evidenceIdsMeta));
    } else if (isInserting) {
      context.missing(_evidenceIdsMeta);
    }
    if (data.containsKey('status')) {
      context.handle(_statusMeta,
          status.isAcceptableOrUnknown(data['status']!, _statusMeta));
    } else if (isInserting) {
      context.missing(_statusMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {key};
  @override
  ReminderRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ReminderRow(
      key: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}key'])!,
      notificationId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}notification_id'])!,
      ownerId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}owner_id'])!,
      kind: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}kind'])!,
      scheduledFor: attachedDatabase.typeMapping.read(
          DriftSqlType.dateTime, data['${effectivePrefix}scheduled_for'])!,
      title: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}title'])!,
      body: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}body'])!,
      evidence: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}evidence'])!,
      evidenceIds: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}evidence_ids'])!,
      status: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}status'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
    );
  }

  @override
  $ReminderRowsTable createAlias(String alias) {
    return $ReminderRowsTable(attachedDatabase, alias);
  }
}

class ReminderRow extends DataClass implements Insertable<ReminderRow> {
  final String key;
  final int notificationId;
  final String ownerId;
  final String kind;
  final DateTime scheduledFor;
  final String title;
  final String body;
  final String evidence;
  final String evidenceIds;
  final String status;
  final DateTime updatedAt;
  const ReminderRow(
      {required this.key,
      required this.notificationId,
      required this.ownerId,
      required this.kind,
      required this.scheduledFor,
      required this.title,
      required this.body,
      required this.evidence,
      required this.evidenceIds,
      required this.status,
      required this.updatedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['key'] = Variable<String>(key);
    map['notification_id'] = Variable<int>(notificationId);
    map['owner_id'] = Variable<String>(ownerId);
    map['kind'] = Variable<String>(kind);
    map['scheduled_for'] = Variable<DateTime>(scheduledFor);
    map['title'] = Variable<String>(title);
    map['body'] = Variable<String>(body);
    map['evidence'] = Variable<String>(evidence);
    map['evidence_ids'] = Variable<String>(evidenceIds);
    map['status'] = Variable<String>(status);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  ReminderRowsCompanion toCompanion(bool nullToAbsent) {
    return ReminderRowsCompanion(
      key: Value(key),
      notificationId: Value(notificationId),
      ownerId: Value(ownerId),
      kind: Value(kind),
      scheduledFor: Value(scheduledFor),
      title: Value(title),
      body: Value(body),
      evidence: Value(evidence),
      evidenceIds: Value(evidenceIds),
      status: Value(status),
      updatedAt: Value(updatedAt),
    );
  }

  factory ReminderRow.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ReminderRow(
      key: serializer.fromJson<String>(json['key']),
      notificationId: serializer.fromJson<int>(json['notificationId']),
      ownerId: serializer.fromJson<String>(json['ownerId']),
      kind: serializer.fromJson<String>(json['kind']),
      scheduledFor: serializer.fromJson<DateTime>(json['scheduledFor']),
      title: serializer.fromJson<String>(json['title']),
      body: serializer.fromJson<String>(json['body']),
      evidence: serializer.fromJson<String>(json['evidence']),
      evidenceIds: serializer.fromJson<String>(json['evidenceIds']),
      status: serializer.fromJson<String>(json['status']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'key': serializer.toJson<String>(key),
      'notificationId': serializer.toJson<int>(notificationId),
      'ownerId': serializer.toJson<String>(ownerId),
      'kind': serializer.toJson<String>(kind),
      'scheduledFor': serializer.toJson<DateTime>(scheduledFor),
      'title': serializer.toJson<String>(title),
      'body': serializer.toJson<String>(body),
      'evidence': serializer.toJson<String>(evidence),
      'evidenceIds': serializer.toJson<String>(evidenceIds),
      'status': serializer.toJson<String>(status),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  ReminderRow copyWith(
          {String? key,
          int? notificationId,
          String? ownerId,
          String? kind,
          DateTime? scheduledFor,
          String? title,
          String? body,
          String? evidence,
          String? evidenceIds,
          String? status,
          DateTime? updatedAt}) =>
      ReminderRow(
        key: key ?? this.key,
        notificationId: notificationId ?? this.notificationId,
        ownerId: ownerId ?? this.ownerId,
        kind: kind ?? this.kind,
        scheduledFor: scheduledFor ?? this.scheduledFor,
        title: title ?? this.title,
        body: body ?? this.body,
        evidence: evidence ?? this.evidence,
        evidenceIds: evidenceIds ?? this.evidenceIds,
        status: status ?? this.status,
        updatedAt: updatedAt ?? this.updatedAt,
      );
  ReminderRow copyWithCompanion(ReminderRowsCompanion data) {
    return ReminderRow(
      key: data.key.present ? data.key.value : this.key,
      notificationId: data.notificationId.present
          ? data.notificationId.value
          : this.notificationId,
      ownerId: data.ownerId.present ? data.ownerId.value : this.ownerId,
      kind: data.kind.present ? data.kind.value : this.kind,
      scheduledFor: data.scheduledFor.present
          ? data.scheduledFor.value
          : this.scheduledFor,
      title: data.title.present ? data.title.value : this.title,
      body: data.body.present ? data.body.value : this.body,
      evidence: data.evidence.present ? data.evidence.value : this.evidence,
      evidenceIds:
          data.evidenceIds.present ? data.evidenceIds.value : this.evidenceIds,
      status: data.status.present ? data.status.value : this.status,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ReminderRow(')
          ..write('key: $key, ')
          ..write('notificationId: $notificationId, ')
          ..write('ownerId: $ownerId, ')
          ..write('kind: $kind, ')
          ..write('scheduledFor: $scheduledFor, ')
          ..write('title: $title, ')
          ..write('body: $body, ')
          ..write('evidence: $evidence, ')
          ..write('evidenceIds: $evidenceIds, ')
          ..write('status: $status, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(key, notificationId, ownerId, kind,
      scheduledFor, title, body, evidence, evidenceIds, status, updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ReminderRow &&
          other.key == this.key &&
          other.notificationId == this.notificationId &&
          other.ownerId == this.ownerId &&
          other.kind == this.kind &&
          other.scheduledFor == this.scheduledFor &&
          other.title == this.title &&
          other.body == this.body &&
          other.evidence == this.evidence &&
          other.evidenceIds == this.evidenceIds &&
          other.status == this.status &&
          other.updatedAt == this.updatedAt);
}

class ReminderRowsCompanion extends UpdateCompanion<ReminderRow> {
  final Value<String> key;
  final Value<int> notificationId;
  final Value<String> ownerId;
  final Value<String> kind;
  final Value<DateTime> scheduledFor;
  final Value<String> title;
  final Value<String> body;
  final Value<String> evidence;
  final Value<String> evidenceIds;
  final Value<String> status;
  final Value<DateTime> updatedAt;
  final Value<int> rowid;
  const ReminderRowsCompanion({
    this.key = const Value.absent(),
    this.notificationId = const Value.absent(),
    this.ownerId = const Value.absent(),
    this.kind = const Value.absent(),
    this.scheduledFor = const Value.absent(),
    this.title = const Value.absent(),
    this.body = const Value.absent(),
    this.evidence = const Value.absent(),
    this.evidenceIds = const Value.absent(),
    this.status = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ReminderRowsCompanion.insert({
    required String key,
    required int notificationId,
    required String ownerId,
    required String kind,
    required DateTime scheduledFor,
    required String title,
    required String body,
    required String evidence,
    required String evidenceIds,
    required String status,
    required DateTime updatedAt,
    this.rowid = const Value.absent(),
  })  : key = Value(key),
        notificationId = Value(notificationId),
        ownerId = Value(ownerId),
        kind = Value(kind),
        scheduledFor = Value(scheduledFor),
        title = Value(title),
        body = Value(body),
        evidence = Value(evidence),
        evidenceIds = Value(evidenceIds),
        status = Value(status),
        updatedAt = Value(updatedAt);
  static Insertable<ReminderRow> custom({
    Expression<String>? key,
    Expression<int>? notificationId,
    Expression<String>? ownerId,
    Expression<String>? kind,
    Expression<DateTime>? scheduledFor,
    Expression<String>? title,
    Expression<String>? body,
    Expression<String>? evidence,
    Expression<String>? evidenceIds,
    Expression<String>? status,
    Expression<DateTime>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (key != null) 'key': key,
      if (notificationId != null) 'notification_id': notificationId,
      if (ownerId != null) 'owner_id': ownerId,
      if (kind != null) 'kind': kind,
      if (scheduledFor != null) 'scheduled_for': scheduledFor,
      if (title != null) 'title': title,
      if (body != null) 'body': body,
      if (evidence != null) 'evidence': evidence,
      if (evidenceIds != null) 'evidence_ids': evidenceIds,
      if (status != null) 'status': status,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ReminderRowsCompanion copyWith(
      {Value<String>? key,
      Value<int>? notificationId,
      Value<String>? ownerId,
      Value<String>? kind,
      Value<DateTime>? scheduledFor,
      Value<String>? title,
      Value<String>? body,
      Value<String>? evidence,
      Value<String>? evidenceIds,
      Value<String>? status,
      Value<DateTime>? updatedAt,
      Value<int>? rowid}) {
    return ReminderRowsCompanion(
      key: key ?? this.key,
      notificationId: notificationId ?? this.notificationId,
      ownerId: ownerId ?? this.ownerId,
      kind: kind ?? this.kind,
      scheduledFor: scheduledFor ?? this.scheduledFor,
      title: title ?? this.title,
      body: body ?? this.body,
      evidence: evidence ?? this.evidence,
      evidenceIds: evidenceIds ?? this.evidenceIds,
      status: status ?? this.status,
      updatedAt: updatedAt ?? this.updatedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (key.present) {
      map['key'] = Variable<String>(key.value);
    }
    if (notificationId.present) {
      map['notification_id'] = Variable<int>(notificationId.value);
    }
    if (ownerId.present) {
      map['owner_id'] = Variable<String>(ownerId.value);
    }
    if (kind.present) {
      map['kind'] = Variable<String>(kind.value);
    }
    if (scheduledFor.present) {
      map['scheduled_for'] = Variable<DateTime>(scheduledFor.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (body.present) {
      map['body'] = Variable<String>(body.value);
    }
    if (evidence.present) {
      map['evidence'] = Variable<String>(evidence.value);
    }
    if (evidenceIds.present) {
      map['evidence_ids'] = Variable<String>(evidenceIds.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ReminderRowsCompanion(')
          ..write('key: $key, ')
          ..write('notificationId: $notificationId, ')
          ..write('ownerId: $ownerId, ')
          ..write('kind: $kind, ')
          ..write('scheduledFor: $scheduledFor, ')
          ..write('title: $title, ')
          ..write('body: $body, ')
          ..write('evidence: $evidence, ')
          ..write('evidenceIds: $evidenceIds, ')
          ..write('status: $status, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $ReminderAuditRowsTable extends ReminderAuditRows
    with TableInfo<$ReminderAuditRowsTable, ReminderAuditRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ReminderAuditRowsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _reminderKeyMeta =
      const VerificationMeta('reminderKey');
  @override
  late final GeneratedColumn<String> reminderKey = GeneratedColumn<String>(
      'reminder_key', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _operationMeta =
      const VerificationMeta('operation');
  @override
  late final GeneratedColumn<String> operation = GeneratedColumn<String>(
      'operation', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _explanationMeta =
      const VerificationMeta('explanation');
  @override
  late final GeneratedColumn<String> explanation = GeneratedColumn<String>(
      'explanation', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, reminderKey, operation, explanation, createdAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'reminder_audit_rows';
  @override
  VerificationContext validateIntegrity(Insertable<ReminderAuditRow> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('reminder_key')) {
      context.handle(
          _reminderKeyMeta,
          reminderKey.isAcceptableOrUnknown(
              data['reminder_key']!, _reminderKeyMeta));
    } else if (isInserting) {
      context.missing(_reminderKeyMeta);
    }
    if (data.containsKey('operation')) {
      context.handle(_operationMeta,
          operation.isAcceptableOrUnknown(data['operation']!, _operationMeta));
    } else if (isInserting) {
      context.missing(_operationMeta);
    }
    if (data.containsKey('explanation')) {
      context.handle(
          _explanationMeta,
          explanation.isAcceptableOrUnknown(
              data['explanation']!, _explanationMeta));
    } else if (isInserting) {
      context.missing(_explanationMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ReminderAuditRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ReminderAuditRow(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      reminderKey: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}reminder_key'])!,
      operation: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}operation'])!,
      explanation: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}explanation'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
    );
  }

  @override
  $ReminderAuditRowsTable createAlias(String alias) {
    return $ReminderAuditRowsTable(attachedDatabase, alias);
  }
}

class ReminderAuditRow extends DataClass
    implements Insertable<ReminderAuditRow> {
  final String id;
  final String reminderKey;
  final String operation;
  final String explanation;
  final DateTime createdAt;
  const ReminderAuditRow(
      {required this.id,
      required this.reminderKey,
      required this.operation,
      required this.explanation,
      required this.createdAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['reminder_key'] = Variable<String>(reminderKey);
    map['operation'] = Variable<String>(operation);
    map['explanation'] = Variable<String>(explanation);
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  ReminderAuditRowsCompanion toCompanion(bool nullToAbsent) {
    return ReminderAuditRowsCompanion(
      id: Value(id),
      reminderKey: Value(reminderKey),
      operation: Value(operation),
      explanation: Value(explanation),
      createdAt: Value(createdAt),
    );
  }

  factory ReminderAuditRow.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ReminderAuditRow(
      id: serializer.fromJson<String>(json['id']),
      reminderKey: serializer.fromJson<String>(json['reminderKey']),
      operation: serializer.fromJson<String>(json['operation']),
      explanation: serializer.fromJson<String>(json['explanation']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'reminderKey': serializer.toJson<String>(reminderKey),
      'operation': serializer.toJson<String>(operation),
      'explanation': serializer.toJson<String>(explanation),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  ReminderAuditRow copyWith(
          {String? id,
          String? reminderKey,
          String? operation,
          String? explanation,
          DateTime? createdAt}) =>
      ReminderAuditRow(
        id: id ?? this.id,
        reminderKey: reminderKey ?? this.reminderKey,
        operation: operation ?? this.operation,
        explanation: explanation ?? this.explanation,
        createdAt: createdAt ?? this.createdAt,
      );
  ReminderAuditRow copyWithCompanion(ReminderAuditRowsCompanion data) {
    return ReminderAuditRow(
      id: data.id.present ? data.id.value : this.id,
      reminderKey:
          data.reminderKey.present ? data.reminderKey.value : this.reminderKey,
      operation: data.operation.present ? data.operation.value : this.operation,
      explanation:
          data.explanation.present ? data.explanation.value : this.explanation,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ReminderAuditRow(')
          ..write('id: $id, ')
          ..write('reminderKey: $reminderKey, ')
          ..write('operation: $operation, ')
          ..write('explanation: $explanation, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, reminderKey, operation, explanation, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ReminderAuditRow &&
          other.id == this.id &&
          other.reminderKey == this.reminderKey &&
          other.operation == this.operation &&
          other.explanation == this.explanation &&
          other.createdAt == this.createdAt);
}

class ReminderAuditRowsCompanion extends UpdateCompanion<ReminderAuditRow> {
  final Value<String> id;
  final Value<String> reminderKey;
  final Value<String> operation;
  final Value<String> explanation;
  final Value<DateTime> createdAt;
  final Value<int> rowid;
  const ReminderAuditRowsCompanion({
    this.id = const Value.absent(),
    this.reminderKey = const Value.absent(),
    this.operation = const Value.absent(),
    this.explanation = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ReminderAuditRowsCompanion.insert({
    required String id,
    required String reminderKey,
    required String operation,
    required String explanation,
    required DateTime createdAt,
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        reminderKey = Value(reminderKey),
        operation = Value(operation),
        explanation = Value(explanation),
        createdAt = Value(createdAt);
  static Insertable<ReminderAuditRow> custom({
    Expression<String>? id,
    Expression<String>? reminderKey,
    Expression<String>? operation,
    Expression<String>? explanation,
    Expression<DateTime>? createdAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (reminderKey != null) 'reminder_key': reminderKey,
      if (operation != null) 'operation': operation,
      if (explanation != null) 'explanation': explanation,
      if (createdAt != null) 'created_at': createdAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ReminderAuditRowsCompanion copyWith(
      {Value<String>? id,
      Value<String>? reminderKey,
      Value<String>? operation,
      Value<String>? explanation,
      Value<DateTime>? createdAt,
      Value<int>? rowid}) {
    return ReminderAuditRowsCompanion(
      id: id ?? this.id,
      reminderKey: reminderKey ?? this.reminderKey,
      operation: operation ?? this.operation,
      explanation: explanation ?? this.explanation,
      createdAt: createdAt ?? this.createdAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (reminderKey.present) {
      map['reminder_key'] = Variable<String>(reminderKey.value);
    }
    if (operation.present) {
      map['operation'] = Variable<String>(operation.value);
    }
    if (explanation.present) {
      map['explanation'] = Variable<String>(explanation.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ReminderAuditRowsCompanion(')
          ..write('id: $id, ')
          ..write('reminderKey: $reminderKey, ')
          ..write('operation: $operation, ')
          ..write('explanation: $explanation, ')
          ..write('createdAt: $createdAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $RouteProfilesTable extends RouteProfiles
    with TableInfo<$RouteProfilesTable, RouteProfileRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $RouteProfilesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _originClusterMeta =
      const VerificationMeta('originCluster');
  @override
  late final GeneratedColumn<String> originCluster = GeneratedColumn<String>(
      'origin_cluster', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _destinationClusterMeta =
      const VerificationMeta('destinationCluster');
  @override
  late final GeneratedColumn<String> destinationCluster =
      GeneratedColumn<String>('destination_cluster', aliasedName, false,
          type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _typicalTransportMeta =
      const VerificationMeta('typicalTransport');
  @override
  late final GeneratedColumn<String> typicalTransport = GeneratedColumn<String>(
      'typical_transport', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _typicalDurationMinutesMeta =
      const VerificationMeta('typicalDurationMinutes');
  @override
  late final GeneratedColumn<int> typicalDurationMinutes = GeneratedColumn<int>(
      'typical_duration_minutes', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _varianceMeta =
      const VerificationMeta('variance');
  @override
  late final GeneratedColumn<double> variance = GeneratedColumn<double>(
      'variance', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _dayOfWeekMeta =
      const VerificationMeta('dayOfWeek');
  @override
  late final GeneratedColumn<int> dayOfWeek = GeneratedColumn<int>(
      'day_of_week', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _timeWindowLabelMeta =
      const VerificationMeta('timeWindowLabel');
  @override
  late final GeneratedColumn<String> timeWindowLabel = GeneratedColumn<String>(
      'time_window_label', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _sampleCountMeta =
      const VerificationMeta('sampleCount');
  @override
  late final GeneratedColumn<int> sampleCount = GeneratedColumn<int>(
      'sample_count', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _lastUpdatedMeta =
      const VerificationMeta('lastUpdated');
  @override
  late final GeneratedColumn<DateTime> lastUpdated = GeneratedColumn<DateTime>(
      'last_updated', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        originCluster,
        destinationCluster,
        typicalTransport,
        typicalDurationMinutes,
        variance,
        dayOfWeek,
        timeWindowLabel,
        sampleCount,
        lastUpdated
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'route_profiles';
  @override
  VerificationContext validateIntegrity(Insertable<RouteProfileRow> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('origin_cluster')) {
      context.handle(
          _originClusterMeta,
          originCluster.isAcceptableOrUnknown(
              data['origin_cluster']!, _originClusterMeta));
    } else if (isInserting) {
      context.missing(_originClusterMeta);
    }
    if (data.containsKey('destination_cluster')) {
      context.handle(
          _destinationClusterMeta,
          destinationCluster.isAcceptableOrUnknown(
              data['destination_cluster']!, _destinationClusterMeta));
    } else if (isInserting) {
      context.missing(_destinationClusterMeta);
    }
    if (data.containsKey('typical_transport')) {
      context.handle(
          _typicalTransportMeta,
          typicalTransport.isAcceptableOrUnknown(
              data['typical_transport']!, _typicalTransportMeta));
    } else if (isInserting) {
      context.missing(_typicalTransportMeta);
    }
    if (data.containsKey('typical_duration_minutes')) {
      context.handle(
          _typicalDurationMinutesMeta,
          typicalDurationMinutes.isAcceptableOrUnknown(
              data['typical_duration_minutes']!, _typicalDurationMinutesMeta));
    } else if (isInserting) {
      context.missing(_typicalDurationMinutesMeta);
    }
    if (data.containsKey('variance')) {
      context.handle(_varianceMeta,
          variance.isAcceptableOrUnknown(data['variance']!, _varianceMeta));
    } else if (isInserting) {
      context.missing(_varianceMeta);
    }
    if (data.containsKey('day_of_week')) {
      context.handle(
          _dayOfWeekMeta,
          dayOfWeek.isAcceptableOrUnknown(
              data['day_of_week']!, _dayOfWeekMeta));
    } else if (isInserting) {
      context.missing(_dayOfWeekMeta);
    }
    if (data.containsKey('time_window_label')) {
      context.handle(
          _timeWindowLabelMeta,
          timeWindowLabel.isAcceptableOrUnknown(
              data['time_window_label']!, _timeWindowLabelMeta));
    } else if (isInserting) {
      context.missing(_timeWindowLabelMeta);
    }
    if (data.containsKey('sample_count')) {
      context.handle(
          _sampleCountMeta,
          sampleCount.isAcceptableOrUnknown(
              data['sample_count']!, _sampleCountMeta));
    } else if (isInserting) {
      context.missing(_sampleCountMeta);
    }
    if (data.containsKey('last_updated')) {
      context.handle(
          _lastUpdatedMeta,
          lastUpdated.isAcceptableOrUnknown(
              data['last_updated']!, _lastUpdatedMeta));
    } else if (isInserting) {
      context.missing(_lastUpdatedMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  RouteProfileRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return RouteProfileRow(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      originCluster: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}origin_cluster'])!,
      destinationCluster: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}destination_cluster'])!,
      typicalTransport: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}typical_transport'])!,
      typicalDurationMinutes: attachedDatabase.typeMapping.read(
          DriftSqlType.int,
          data['${effectivePrefix}typical_duration_minutes'])!,
      variance: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}variance'])!,
      dayOfWeek: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}day_of_week'])!,
      timeWindowLabel: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}time_window_label'])!,
      sampleCount: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}sample_count'])!,
      lastUpdated: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}last_updated'])!,
    );
  }

  @override
  $RouteProfilesTable createAlias(String alias) {
    return $RouteProfilesTable(attachedDatabase, alias);
  }
}

class RouteProfileRow extends DataClass implements Insertable<RouteProfileRow> {
  final String id;
  final String originCluster;
  final String destinationCluster;
  final String typicalTransport;
  final int typicalDurationMinutes;
  final double variance;
  final int dayOfWeek;
  final String timeWindowLabel;
  final int sampleCount;
  final DateTime lastUpdated;
  const RouteProfileRow(
      {required this.id,
      required this.originCluster,
      required this.destinationCluster,
      required this.typicalTransport,
      required this.typicalDurationMinutes,
      required this.variance,
      required this.dayOfWeek,
      required this.timeWindowLabel,
      required this.sampleCount,
      required this.lastUpdated});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['origin_cluster'] = Variable<String>(originCluster);
    map['destination_cluster'] = Variable<String>(destinationCluster);
    map['typical_transport'] = Variable<String>(typicalTransport);
    map['typical_duration_minutes'] = Variable<int>(typicalDurationMinutes);
    map['variance'] = Variable<double>(variance);
    map['day_of_week'] = Variable<int>(dayOfWeek);
    map['time_window_label'] = Variable<String>(timeWindowLabel);
    map['sample_count'] = Variable<int>(sampleCount);
    map['last_updated'] = Variable<DateTime>(lastUpdated);
    return map;
  }

  RouteProfilesCompanion toCompanion(bool nullToAbsent) {
    return RouteProfilesCompanion(
      id: Value(id),
      originCluster: Value(originCluster),
      destinationCluster: Value(destinationCluster),
      typicalTransport: Value(typicalTransport),
      typicalDurationMinutes: Value(typicalDurationMinutes),
      variance: Value(variance),
      dayOfWeek: Value(dayOfWeek),
      timeWindowLabel: Value(timeWindowLabel),
      sampleCount: Value(sampleCount),
      lastUpdated: Value(lastUpdated),
    );
  }

  factory RouteProfileRow.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return RouteProfileRow(
      id: serializer.fromJson<String>(json['id']),
      originCluster: serializer.fromJson<String>(json['originCluster']),
      destinationCluster:
          serializer.fromJson<String>(json['destinationCluster']),
      typicalTransport: serializer.fromJson<String>(json['typicalTransport']),
      typicalDurationMinutes:
          serializer.fromJson<int>(json['typicalDurationMinutes']),
      variance: serializer.fromJson<double>(json['variance']),
      dayOfWeek: serializer.fromJson<int>(json['dayOfWeek']),
      timeWindowLabel: serializer.fromJson<String>(json['timeWindowLabel']),
      sampleCount: serializer.fromJson<int>(json['sampleCount']),
      lastUpdated: serializer.fromJson<DateTime>(json['lastUpdated']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'originCluster': serializer.toJson<String>(originCluster),
      'destinationCluster': serializer.toJson<String>(destinationCluster),
      'typicalTransport': serializer.toJson<String>(typicalTransport),
      'typicalDurationMinutes': serializer.toJson<int>(typicalDurationMinutes),
      'variance': serializer.toJson<double>(variance),
      'dayOfWeek': serializer.toJson<int>(dayOfWeek),
      'timeWindowLabel': serializer.toJson<String>(timeWindowLabel),
      'sampleCount': serializer.toJson<int>(sampleCount),
      'lastUpdated': serializer.toJson<DateTime>(lastUpdated),
    };
  }

  RouteProfileRow copyWith(
          {String? id,
          String? originCluster,
          String? destinationCluster,
          String? typicalTransport,
          int? typicalDurationMinutes,
          double? variance,
          int? dayOfWeek,
          String? timeWindowLabel,
          int? sampleCount,
          DateTime? lastUpdated}) =>
      RouteProfileRow(
        id: id ?? this.id,
        originCluster: originCluster ?? this.originCluster,
        destinationCluster: destinationCluster ?? this.destinationCluster,
        typicalTransport: typicalTransport ?? this.typicalTransport,
        typicalDurationMinutes:
            typicalDurationMinutes ?? this.typicalDurationMinutes,
        variance: variance ?? this.variance,
        dayOfWeek: dayOfWeek ?? this.dayOfWeek,
        timeWindowLabel: timeWindowLabel ?? this.timeWindowLabel,
        sampleCount: sampleCount ?? this.sampleCount,
        lastUpdated: lastUpdated ?? this.lastUpdated,
      );
  RouteProfileRow copyWithCompanion(RouteProfilesCompanion data) {
    return RouteProfileRow(
      id: data.id.present ? data.id.value : this.id,
      originCluster: data.originCluster.present
          ? data.originCluster.value
          : this.originCluster,
      destinationCluster: data.destinationCluster.present
          ? data.destinationCluster.value
          : this.destinationCluster,
      typicalTransport: data.typicalTransport.present
          ? data.typicalTransport.value
          : this.typicalTransport,
      typicalDurationMinutes: data.typicalDurationMinutes.present
          ? data.typicalDurationMinutes.value
          : this.typicalDurationMinutes,
      variance: data.variance.present ? data.variance.value : this.variance,
      dayOfWeek: data.dayOfWeek.present ? data.dayOfWeek.value : this.dayOfWeek,
      timeWindowLabel: data.timeWindowLabel.present
          ? data.timeWindowLabel.value
          : this.timeWindowLabel,
      sampleCount:
          data.sampleCount.present ? data.sampleCount.value : this.sampleCount,
      lastUpdated:
          data.lastUpdated.present ? data.lastUpdated.value : this.lastUpdated,
    );
  }

  @override
  String toString() {
    return (StringBuffer('RouteProfileRow(')
          ..write('id: $id, ')
          ..write('originCluster: $originCluster, ')
          ..write('destinationCluster: $destinationCluster, ')
          ..write('typicalTransport: $typicalTransport, ')
          ..write('typicalDurationMinutes: $typicalDurationMinutes, ')
          ..write('variance: $variance, ')
          ..write('dayOfWeek: $dayOfWeek, ')
          ..write('timeWindowLabel: $timeWindowLabel, ')
          ..write('sampleCount: $sampleCount, ')
          ..write('lastUpdated: $lastUpdated')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      originCluster,
      destinationCluster,
      typicalTransport,
      typicalDurationMinutes,
      variance,
      dayOfWeek,
      timeWindowLabel,
      sampleCount,
      lastUpdated);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is RouteProfileRow &&
          other.id == this.id &&
          other.originCluster == this.originCluster &&
          other.destinationCluster == this.destinationCluster &&
          other.typicalTransport == this.typicalTransport &&
          other.typicalDurationMinutes == this.typicalDurationMinutes &&
          other.variance == this.variance &&
          other.dayOfWeek == this.dayOfWeek &&
          other.timeWindowLabel == this.timeWindowLabel &&
          other.sampleCount == this.sampleCount &&
          other.lastUpdated == this.lastUpdated);
}

class RouteProfilesCompanion extends UpdateCompanion<RouteProfileRow> {
  final Value<String> id;
  final Value<String> originCluster;
  final Value<String> destinationCluster;
  final Value<String> typicalTransport;
  final Value<int> typicalDurationMinutes;
  final Value<double> variance;
  final Value<int> dayOfWeek;
  final Value<String> timeWindowLabel;
  final Value<int> sampleCount;
  final Value<DateTime> lastUpdated;
  final Value<int> rowid;
  const RouteProfilesCompanion({
    this.id = const Value.absent(),
    this.originCluster = const Value.absent(),
    this.destinationCluster = const Value.absent(),
    this.typicalTransport = const Value.absent(),
    this.typicalDurationMinutes = const Value.absent(),
    this.variance = const Value.absent(),
    this.dayOfWeek = const Value.absent(),
    this.timeWindowLabel = const Value.absent(),
    this.sampleCount = const Value.absent(),
    this.lastUpdated = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  RouteProfilesCompanion.insert({
    required String id,
    required String originCluster,
    required String destinationCluster,
    required String typicalTransport,
    required int typicalDurationMinutes,
    required double variance,
    required int dayOfWeek,
    required String timeWindowLabel,
    required int sampleCount,
    required DateTime lastUpdated,
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        originCluster = Value(originCluster),
        destinationCluster = Value(destinationCluster),
        typicalTransport = Value(typicalTransport),
        typicalDurationMinutes = Value(typicalDurationMinutes),
        variance = Value(variance),
        dayOfWeek = Value(dayOfWeek),
        timeWindowLabel = Value(timeWindowLabel),
        sampleCount = Value(sampleCount),
        lastUpdated = Value(lastUpdated);
  static Insertable<RouteProfileRow> custom({
    Expression<String>? id,
    Expression<String>? originCluster,
    Expression<String>? destinationCluster,
    Expression<String>? typicalTransport,
    Expression<int>? typicalDurationMinutes,
    Expression<double>? variance,
    Expression<int>? dayOfWeek,
    Expression<String>? timeWindowLabel,
    Expression<int>? sampleCount,
    Expression<DateTime>? lastUpdated,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (originCluster != null) 'origin_cluster': originCluster,
      if (destinationCluster != null) 'destination_cluster': destinationCluster,
      if (typicalTransport != null) 'typical_transport': typicalTransport,
      if (typicalDurationMinutes != null)
        'typical_duration_minutes': typicalDurationMinutes,
      if (variance != null) 'variance': variance,
      if (dayOfWeek != null) 'day_of_week': dayOfWeek,
      if (timeWindowLabel != null) 'time_window_label': timeWindowLabel,
      if (sampleCount != null) 'sample_count': sampleCount,
      if (lastUpdated != null) 'last_updated': lastUpdated,
      if (rowid != null) 'rowid': rowid,
    });
  }

  RouteProfilesCompanion copyWith(
      {Value<String>? id,
      Value<String>? originCluster,
      Value<String>? destinationCluster,
      Value<String>? typicalTransport,
      Value<int>? typicalDurationMinutes,
      Value<double>? variance,
      Value<int>? dayOfWeek,
      Value<String>? timeWindowLabel,
      Value<int>? sampleCount,
      Value<DateTime>? lastUpdated,
      Value<int>? rowid}) {
    return RouteProfilesCompanion(
      id: id ?? this.id,
      originCluster: originCluster ?? this.originCluster,
      destinationCluster: destinationCluster ?? this.destinationCluster,
      typicalTransport: typicalTransport ?? this.typicalTransport,
      typicalDurationMinutes:
          typicalDurationMinutes ?? this.typicalDurationMinutes,
      variance: variance ?? this.variance,
      dayOfWeek: dayOfWeek ?? this.dayOfWeek,
      timeWindowLabel: timeWindowLabel ?? this.timeWindowLabel,
      sampleCount: sampleCount ?? this.sampleCount,
      lastUpdated: lastUpdated ?? this.lastUpdated,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (originCluster.present) {
      map['origin_cluster'] = Variable<String>(originCluster.value);
    }
    if (destinationCluster.present) {
      map['destination_cluster'] = Variable<String>(destinationCluster.value);
    }
    if (typicalTransport.present) {
      map['typical_transport'] = Variable<String>(typicalTransport.value);
    }
    if (typicalDurationMinutes.present) {
      map['typical_duration_minutes'] =
          Variable<int>(typicalDurationMinutes.value);
    }
    if (variance.present) {
      map['variance'] = Variable<double>(variance.value);
    }
    if (dayOfWeek.present) {
      map['day_of_week'] = Variable<int>(dayOfWeek.value);
    }
    if (timeWindowLabel.present) {
      map['time_window_label'] = Variable<String>(timeWindowLabel.value);
    }
    if (sampleCount.present) {
      map['sample_count'] = Variable<int>(sampleCount.value);
    }
    if (lastUpdated.present) {
      map['last_updated'] = Variable<DateTime>(lastUpdated.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RouteProfilesCompanion(')
          ..write('id: $id, ')
          ..write('originCluster: $originCluster, ')
          ..write('destinationCluster: $destinationCluster, ')
          ..write('typicalTransport: $typicalTransport, ')
          ..write('typicalDurationMinutes: $typicalDurationMinutes, ')
          ..write('variance: $variance, ')
          ..write('dayOfWeek: $dayOfWeek, ')
          ..write('timeWindowLabel: $timeWindowLabel, ')
          ..write('sampleCount: $sampleCount, ')
          ..write('lastUpdated: $lastUpdated, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $RouteObservationsTable extends RouteObservations
    with TableInfo<$RouteObservationsTable, RouteObservationRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $RouteObservationsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _routeProfileIdMeta =
      const VerificationMeta('routeProfileId');
  @override
  late final GeneratedColumn<String> routeProfileId = GeneratedColumn<String>(
      'route_profile_id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES route_profiles (id)'));
  static const VerificationMeta _durationMinutesMeta =
      const VerificationMeta('durationMinutes');
  @override
  late final GeneratedColumn<int> durationMinutes = GeneratedColumn<int>(
      'duration_minutes', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _transportMeta =
      const VerificationMeta('transport');
  @override
  late final GeneratedColumn<String> transport = GeneratedColumn<String>(
      'transport', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _observedAtMeta =
      const VerificationMeta('observedAt');
  @override
  late final GeneratedColumn<DateTime> observedAt = GeneratedColumn<DateTime>(
      'observed_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _sourceMeta = const VerificationMeta('source');
  @override
  late final GeneratedColumn<String> source = GeneratedColumn<String>(
      'source', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, routeProfileId, durationMinutes, transport, observedAt, source];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'route_observations';
  @override
  VerificationContext validateIntegrity(
      Insertable<RouteObservationRow> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('route_profile_id')) {
      context.handle(
          _routeProfileIdMeta,
          routeProfileId.isAcceptableOrUnknown(
              data['route_profile_id']!, _routeProfileIdMeta));
    } else if (isInserting) {
      context.missing(_routeProfileIdMeta);
    }
    if (data.containsKey('duration_minutes')) {
      context.handle(
          _durationMinutesMeta,
          durationMinutes.isAcceptableOrUnknown(
              data['duration_minutes']!, _durationMinutesMeta));
    } else if (isInserting) {
      context.missing(_durationMinutesMeta);
    }
    if (data.containsKey('transport')) {
      context.handle(_transportMeta,
          transport.isAcceptableOrUnknown(data['transport']!, _transportMeta));
    } else if (isInserting) {
      context.missing(_transportMeta);
    }
    if (data.containsKey('observed_at')) {
      context.handle(
          _observedAtMeta,
          observedAt.isAcceptableOrUnknown(
              data['observed_at']!, _observedAtMeta));
    } else if (isInserting) {
      context.missing(_observedAtMeta);
    }
    if (data.containsKey('source')) {
      context.handle(_sourceMeta,
          source.isAcceptableOrUnknown(data['source']!, _sourceMeta));
    } else if (isInserting) {
      context.missing(_sourceMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  RouteObservationRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return RouteObservationRow(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      routeProfileId: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}route_profile_id'])!,
      durationMinutes: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}duration_minutes'])!,
      transport: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}transport'])!,
      observedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}observed_at'])!,
      source: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}source'])!,
    );
  }

  @override
  $RouteObservationsTable createAlias(String alias) {
    return $RouteObservationsTable(attachedDatabase, alias);
  }
}

class RouteObservationRow extends DataClass
    implements Insertable<RouteObservationRow> {
  final String id;
  final String routeProfileId;
  final int durationMinutes;
  final String transport;
  final DateTime observedAt;
  final String source;
  const RouteObservationRow(
      {required this.id,
      required this.routeProfileId,
      required this.durationMinutes,
      required this.transport,
      required this.observedAt,
      required this.source});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['route_profile_id'] = Variable<String>(routeProfileId);
    map['duration_minutes'] = Variable<int>(durationMinutes);
    map['transport'] = Variable<String>(transport);
    map['observed_at'] = Variable<DateTime>(observedAt);
    map['source'] = Variable<String>(source);
    return map;
  }

  RouteObservationsCompanion toCompanion(bool nullToAbsent) {
    return RouteObservationsCompanion(
      id: Value(id),
      routeProfileId: Value(routeProfileId),
      durationMinutes: Value(durationMinutes),
      transport: Value(transport),
      observedAt: Value(observedAt),
      source: Value(source),
    );
  }

  factory RouteObservationRow.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return RouteObservationRow(
      id: serializer.fromJson<String>(json['id']),
      routeProfileId: serializer.fromJson<String>(json['routeProfileId']),
      durationMinutes: serializer.fromJson<int>(json['durationMinutes']),
      transport: serializer.fromJson<String>(json['transport']),
      observedAt: serializer.fromJson<DateTime>(json['observedAt']),
      source: serializer.fromJson<String>(json['source']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'routeProfileId': serializer.toJson<String>(routeProfileId),
      'durationMinutes': serializer.toJson<int>(durationMinutes),
      'transport': serializer.toJson<String>(transport),
      'observedAt': serializer.toJson<DateTime>(observedAt),
      'source': serializer.toJson<String>(source),
    };
  }

  RouteObservationRow copyWith(
          {String? id,
          String? routeProfileId,
          int? durationMinutes,
          String? transport,
          DateTime? observedAt,
          String? source}) =>
      RouteObservationRow(
        id: id ?? this.id,
        routeProfileId: routeProfileId ?? this.routeProfileId,
        durationMinutes: durationMinutes ?? this.durationMinutes,
        transport: transport ?? this.transport,
        observedAt: observedAt ?? this.observedAt,
        source: source ?? this.source,
      );
  RouteObservationRow copyWithCompanion(RouteObservationsCompanion data) {
    return RouteObservationRow(
      id: data.id.present ? data.id.value : this.id,
      routeProfileId: data.routeProfileId.present
          ? data.routeProfileId.value
          : this.routeProfileId,
      durationMinutes: data.durationMinutes.present
          ? data.durationMinutes.value
          : this.durationMinutes,
      transport: data.transport.present ? data.transport.value : this.transport,
      observedAt:
          data.observedAt.present ? data.observedAt.value : this.observedAt,
      source: data.source.present ? data.source.value : this.source,
    );
  }

  @override
  String toString() {
    return (StringBuffer('RouteObservationRow(')
          ..write('id: $id, ')
          ..write('routeProfileId: $routeProfileId, ')
          ..write('durationMinutes: $durationMinutes, ')
          ..write('transport: $transport, ')
          ..write('observedAt: $observedAt, ')
          ..write('source: $source')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id, routeProfileId, durationMinutes, transport, observedAt, source);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is RouteObservationRow &&
          other.id == this.id &&
          other.routeProfileId == this.routeProfileId &&
          other.durationMinutes == this.durationMinutes &&
          other.transport == this.transport &&
          other.observedAt == this.observedAt &&
          other.source == this.source);
}

class RouteObservationsCompanion extends UpdateCompanion<RouteObservationRow> {
  final Value<String> id;
  final Value<String> routeProfileId;
  final Value<int> durationMinutes;
  final Value<String> transport;
  final Value<DateTime> observedAt;
  final Value<String> source;
  final Value<int> rowid;
  const RouteObservationsCompanion({
    this.id = const Value.absent(),
    this.routeProfileId = const Value.absent(),
    this.durationMinutes = const Value.absent(),
    this.transport = const Value.absent(),
    this.observedAt = const Value.absent(),
    this.source = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  RouteObservationsCompanion.insert({
    required String id,
    required String routeProfileId,
    required int durationMinutes,
    required String transport,
    required DateTime observedAt,
    required String source,
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        routeProfileId = Value(routeProfileId),
        durationMinutes = Value(durationMinutes),
        transport = Value(transport),
        observedAt = Value(observedAt),
        source = Value(source);
  static Insertable<RouteObservationRow> custom({
    Expression<String>? id,
    Expression<String>? routeProfileId,
    Expression<int>? durationMinutes,
    Expression<String>? transport,
    Expression<DateTime>? observedAt,
    Expression<String>? source,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (routeProfileId != null) 'route_profile_id': routeProfileId,
      if (durationMinutes != null) 'duration_minutes': durationMinutes,
      if (transport != null) 'transport': transport,
      if (observedAt != null) 'observed_at': observedAt,
      if (source != null) 'source': source,
      if (rowid != null) 'rowid': rowid,
    });
  }

  RouteObservationsCompanion copyWith(
      {Value<String>? id,
      Value<String>? routeProfileId,
      Value<int>? durationMinutes,
      Value<String>? transport,
      Value<DateTime>? observedAt,
      Value<String>? source,
      Value<int>? rowid}) {
    return RouteObservationsCompanion(
      id: id ?? this.id,
      routeProfileId: routeProfileId ?? this.routeProfileId,
      durationMinutes: durationMinutes ?? this.durationMinutes,
      transport: transport ?? this.transport,
      observedAt: observedAt ?? this.observedAt,
      source: source ?? this.source,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (routeProfileId.present) {
      map['route_profile_id'] = Variable<String>(routeProfileId.value);
    }
    if (durationMinutes.present) {
      map['duration_minutes'] = Variable<int>(durationMinutes.value);
    }
    if (transport.present) {
      map['transport'] = Variable<String>(transport.value);
    }
    if (observedAt.present) {
      map['observed_at'] = Variable<DateTime>(observedAt.value);
    }
    if (source.present) {
      map['source'] = Variable<String>(source.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RouteObservationsCompanion(')
          ..write('id: $id, ')
          ..write('routeProfileId: $routeProfileId, ')
          ..write('durationMinutes: $durationMinutes, ')
          ..write('transport: $transport, ')
          ..write('observedAt: $observedAt, ')
          ..write('source: $source, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $WeatherEventsTable extends WeatherEvents
    with TableInfo<$WeatherEventsTable, WeatherEventRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $WeatherEventsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _conditionMeta =
      const VerificationMeta('condition');
  @override
  late final GeneratedColumn<String> condition = GeneratedColumn<String>(
      'condition', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _startsAtMeta =
      const VerificationMeta('startsAt');
  @override
  late final GeneratedColumn<DateTime> startsAt = GeneratedColumn<DateTime>(
      'starts_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _endsAtMeta = const VerificationMeta('endsAt');
  @override
  late final GeneratedColumn<DateTime> endsAt = GeneratedColumn<DateTime>(
      'ends_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _probabilityMeta =
      const VerificationMeta('probability');
  @override
  late final GeneratedColumn<double> probability = GeneratedColumn<double>(
      'probability', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _severityMeta =
      const VerificationMeta('severity');
  @override
  late final GeneratedColumn<int> severity = GeneratedColumn<int>(
      'severity', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _sourceMeta = const VerificationMeta('source');
  @override
  late final GeneratedColumn<String> source = GeneratedColumn<String>(
      'source', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _fetchedAtMeta =
      const VerificationMeta('fetchedAt');
  @override
  late final GeneratedColumn<DateTime> fetchedAt = GeneratedColumn<DateTime>(
      'fetched_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        condition,
        startsAt,
        endsAt,
        probability,
        severity,
        source,
        fetchedAt
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'weather_events';
  @override
  VerificationContext validateIntegrity(Insertable<WeatherEventRow> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('condition')) {
      context.handle(_conditionMeta,
          condition.isAcceptableOrUnknown(data['condition']!, _conditionMeta));
    } else if (isInserting) {
      context.missing(_conditionMeta);
    }
    if (data.containsKey('starts_at')) {
      context.handle(_startsAtMeta,
          startsAt.isAcceptableOrUnknown(data['starts_at']!, _startsAtMeta));
    } else if (isInserting) {
      context.missing(_startsAtMeta);
    }
    if (data.containsKey('ends_at')) {
      context.handle(_endsAtMeta,
          endsAt.isAcceptableOrUnknown(data['ends_at']!, _endsAtMeta));
    } else if (isInserting) {
      context.missing(_endsAtMeta);
    }
    if (data.containsKey('probability')) {
      context.handle(
          _probabilityMeta,
          probability.isAcceptableOrUnknown(
              data['probability']!, _probabilityMeta));
    } else if (isInserting) {
      context.missing(_probabilityMeta);
    }
    if (data.containsKey('severity')) {
      context.handle(_severityMeta,
          severity.isAcceptableOrUnknown(data['severity']!, _severityMeta));
    } else if (isInserting) {
      context.missing(_severityMeta);
    }
    if (data.containsKey('source')) {
      context.handle(_sourceMeta,
          source.isAcceptableOrUnknown(data['source']!, _sourceMeta));
    } else if (isInserting) {
      context.missing(_sourceMeta);
    }
    if (data.containsKey('fetched_at')) {
      context.handle(_fetchedAtMeta,
          fetchedAt.isAcceptableOrUnknown(data['fetched_at']!, _fetchedAtMeta));
    } else if (isInserting) {
      context.missing(_fetchedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  WeatherEventRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return WeatherEventRow(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      condition: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}condition'])!,
      startsAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}starts_at'])!,
      endsAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}ends_at'])!,
      probability: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}probability'])!,
      severity: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}severity'])!,
      source: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}source'])!,
      fetchedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}fetched_at'])!,
    );
  }

  @override
  $WeatherEventsTable createAlias(String alias) {
    return $WeatherEventsTable(attachedDatabase, alias);
  }
}

class WeatherEventRow extends DataClass implements Insertable<WeatherEventRow> {
  final String id;
  final String condition;
  final DateTime startsAt;
  final DateTime endsAt;
  final double probability;
  final int severity;
  final String source;
  final DateTime fetchedAt;
  const WeatherEventRow(
      {required this.id,
      required this.condition,
      required this.startsAt,
      required this.endsAt,
      required this.probability,
      required this.severity,
      required this.source,
      required this.fetchedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['condition'] = Variable<String>(condition);
    map['starts_at'] = Variable<DateTime>(startsAt);
    map['ends_at'] = Variable<DateTime>(endsAt);
    map['probability'] = Variable<double>(probability);
    map['severity'] = Variable<int>(severity);
    map['source'] = Variable<String>(source);
    map['fetched_at'] = Variable<DateTime>(fetchedAt);
    return map;
  }

  WeatherEventsCompanion toCompanion(bool nullToAbsent) {
    return WeatherEventsCompanion(
      id: Value(id),
      condition: Value(condition),
      startsAt: Value(startsAt),
      endsAt: Value(endsAt),
      probability: Value(probability),
      severity: Value(severity),
      source: Value(source),
      fetchedAt: Value(fetchedAt),
    );
  }

  factory WeatherEventRow.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return WeatherEventRow(
      id: serializer.fromJson<String>(json['id']),
      condition: serializer.fromJson<String>(json['condition']),
      startsAt: serializer.fromJson<DateTime>(json['startsAt']),
      endsAt: serializer.fromJson<DateTime>(json['endsAt']),
      probability: serializer.fromJson<double>(json['probability']),
      severity: serializer.fromJson<int>(json['severity']),
      source: serializer.fromJson<String>(json['source']),
      fetchedAt: serializer.fromJson<DateTime>(json['fetchedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'condition': serializer.toJson<String>(condition),
      'startsAt': serializer.toJson<DateTime>(startsAt),
      'endsAt': serializer.toJson<DateTime>(endsAt),
      'probability': serializer.toJson<double>(probability),
      'severity': serializer.toJson<int>(severity),
      'source': serializer.toJson<String>(source),
      'fetchedAt': serializer.toJson<DateTime>(fetchedAt),
    };
  }

  WeatherEventRow copyWith(
          {String? id,
          String? condition,
          DateTime? startsAt,
          DateTime? endsAt,
          double? probability,
          int? severity,
          String? source,
          DateTime? fetchedAt}) =>
      WeatherEventRow(
        id: id ?? this.id,
        condition: condition ?? this.condition,
        startsAt: startsAt ?? this.startsAt,
        endsAt: endsAt ?? this.endsAt,
        probability: probability ?? this.probability,
        severity: severity ?? this.severity,
        source: source ?? this.source,
        fetchedAt: fetchedAt ?? this.fetchedAt,
      );
  WeatherEventRow copyWithCompanion(WeatherEventsCompanion data) {
    return WeatherEventRow(
      id: data.id.present ? data.id.value : this.id,
      condition: data.condition.present ? data.condition.value : this.condition,
      startsAt: data.startsAt.present ? data.startsAt.value : this.startsAt,
      endsAt: data.endsAt.present ? data.endsAt.value : this.endsAt,
      probability:
          data.probability.present ? data.probability.value : this.probability,
      severity: data.severity.present ? data.severity.value : this.severity,
      source: data.source.present ? data.source.value : this.source,
      fetchedAt: data.fetchedAt.present ? data.fetchedAt.value : this.fetchedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('WeatherEventRow(')
          ..write('id: $id, ')
          ..write('condition: $condition, ')
          ..write('startsAt: $startsAt, ')
          ..write('endsAt: $endsAt, ')
          ..write('probability: $probability, ')
          ..write('severity: $severity, ')
          ..write('source: $source, ')
          ..write('fetchedAt: $fetchedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, condition, startsAt, endsAt, probability,
      severity, source, fetchedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is WeatherEventRow &&
          other.id == this.id &&
          other.condition == this.condition &&
          other.startsAt == this.startsAt &&
          other.endsAt == this.endsAt &&
          other.probability == this.probability &&
          other.severity == this.severity &&
          other.source == this.source &&
          other.fetchedAt == this.fetchedAt);
}

class WeatherEventsCompanion extends UpdateCompanion<WeatherEventRow> {
  final Value<String> id;
  final Value<String> condition;
  final Value<DateTime> startsAt;
  final Value<DateTime> endsAt;
  final Value<double> probability;
  final Value<int> severity;
  final Value<String> source;
  final Value<DateTime> fetchedAt;
  final Value<int> rowid;
  const WeatherEventsCompanion({
    this.id = const Value.absent(),
    this.condition = const Value.absent(),
    this.startsAt = const Value.absent(),
    this.endsAt = const Value.absent(),
    this.probability = const Value.absent(),
    this.severity = const Value.absent(),
    this.source = const Value.absent(),
    this.fetchedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  WeatherEventsCompanion.insert({
    required String id,
    required String condition,
    required DateTime startsAt,
    required DateTime endsAt,
    required double probability,
    required int severity,
    required String source,
    required DateTime fetchedAt,
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        condition = Value(condition),
        startsAt = Value(startsAt),
        endsAt = Value(endsAt),
        probability = Value(probability),
        severity = Value(severity),
        source = Value(source),
        fetchedAt = Value(fetchedAt);
  static Insertable<WeatherEventRow> custom({
    Expression<String>? id,
    Expression<String>? condition,
    Expression<DateTime>? startsAt,
    Expression<DateTime>? endsAt,
    Expression<double>? probability,
    Expression<int>? severity,
    Expression<String>? source,
    Expression<DateTime>? fetchedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (condition != null) 'condition': condition,
      if (startsAt != null) 'starts_at': startsAt,
      if (endsAt != null) 'ends_at': endsAt,
      if (probability != null) 'probability': probability,
      if (severity != null) 'severity': severity,
      if (source != null) 'source': source,
      if (fetchedAt != null) 'fetched_at': fetchedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  WeatherEventsCompanion copyWith(
      {Value<String>? id,
      Value<String>? condition,
      Value<DateTime>? startsAt,
      Value<DateTime>? endsAt,
      Value<double>? probability,
      Value<int>? severity,
      Value<String>? source,
      Value<DateTime>? fetchedAt,
      Value<int>? rowid}) {
    return WeatherEventsCompanion(
      id: id ?? this.id,
      condition: condition ?? this.condition,
      startsAt: startsAt ?? this.startsAt,
      endsAt: endsAt ?? this.endsAt,
      probability: probability ?? this.probability,
      severity: severity ?? this.severity,
      source: source ?? this.source,
      fetchedAt: fetchedAt ?? this.fetchedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (condition.present) {
      map['condition'] = Variable<String>(condition.value);
    }
    if (startsAt.present) {
      map['starts_at'] = Variable<DateTime>(startsAt.value);
    }
    if (endsAt.present) {
      map['ends_at'] = Variable<DateTime>(endsAt.value);
    }
    if (probability.present) {
      map['probability'] = Variable<double>(probability.value);
    }
    if (severity.present) {
      map['severity'] = Variable<int>(severity.value);
    }
    if (source.present) {
      map['source'] = Variable<String>(source.value);
    }
    if (fetchedAt.present) {
      map['fetched_at'] = Variable<DateTime>(fetchedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('WeatherEventsCompanion(')
          ..write('id: $id, ')
          ..write('condition: $condition, ')
          ..write('startsAt: $startsAt, ')
          ..write('endsAt: $endsAt, ')
          ..write('probability: $probability, ')
          ..write('severity: $severity, ')
          ..write('source: $source, ')
          ..write('fetchedAt: $fetchedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $PlannerTasksTable extends PlannerTasks
    with TableInfo<$PlannerTasksTable, PlannerTaskRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PlannerTasksTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _durationMinutesMeta =
      const VerificationMeta('durationMinutes');
  @override
  late final GeneratedColumn<int> durationMinutes = GeneratedColumn<int>(
      'duration_minutes', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _deadlineMeta =
      const VerificationMeta('deadline');
  @override
  late final GeneratedColumn<DateTime> deadline = GeneratedColumn<DateTime>(
      'deadline', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _priorityMeta =
      const VerificationMeta('priority');
  @override
  late final GeneratedColumn<String> priority = GeneratedColumn<String>(
      'priority', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
      'status', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _earliestStartMeta =
      const VerificationMeta('earliestStart');
  @override
  late final GeneratedColumn<DateTime> earliestStart =
      GeneratedColumn<DateTime>('earliest_start', aliasedName, true,
          type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
      'notes', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        title,
        durationMinutes,
        deadline,
        priority,
        status,
        createdAt,
        updatedAt,
        earliestStart,
        notes
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'planner_tasks';
  @override
  VerificationContext validateIntegrity(Insertable<PlannerTaskRow> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('duration_minutes')) {
      context.handle(
          _durationMinutesMeta,
          durationMinutes.isAcceptableOrUnknown(
              data['duration_minutes']!, _durationMinutesMeta));
    } else if (isInserting) {
      context.missing(_durationMinutesMeta);
    }
    if (data.containsKey('deadline')) {
      context.handle(_deadlineMeta,
          deadline.isAcceptableOrUnknown(data['deadline']!, _deadlineMeta));
    } else if (isInserting) {
      context.missing(_deadlineMeta);
    }
    if (data.containsKey('priority')) {
      context.handle(_priorityMeta,
          priority.isAcceptableOrUnknown(data['priority']!, _priorityMeta));
    } else if (isInserting) {
      context.missing(_priorityMeta);
    }
    if (data.containsKey('status')) {
      context.handle(_statusMeta,
          status.isAcceptableOrUnknown(data['status']!, _statusMeta));
    } else if (isInserting) {
      context.missing(_statusMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    if (data.containsKey('earliest_start')) {
      context.handle(
          _earliestStartMeta,
          earliestStart.isAcceptableOrUnknown(
              data['earliest_start']!, _earliestStartMeta));
    }
    if (data.containsKey('notes')) {
      context.handle(
          _notesMeta, notes.isAcceptableOrUnknown(data['notes']!, _notesMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  PlannerTaskRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PlannerTaskRow(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      title: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}title'])!,
      durationMinutes: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}duration_minutes'])!,
      deadline: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}deadline'])!,
      priority: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}priority'])!,
      status: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}status'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
      earliestStart: attachedDatabase.typeMapping.read(
          DriftSqlType.dateTime, data['${effectivePrefix}earliest_start']),
      notes: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}notes']),
    );
  }

  @override
  $PlannerTasksTable createAlias(String alias) {
    return $PlannerTasksTable(attachedDatabase, alias);
  }
}

class PlannerTaskRow extends DataClass implements Insertable<PlannerTaskRow> {
  final String id;
  final String title;
  final int durationMinutes;
  final DateTime deadline;
  final String priority;
  final String status;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime? earliestStart;
  final String? notes;
  const PlannerTaskRow(
      {required this.id,
      required this.title,
      required this.durationMinutes,
      required this.deadline,
      required this.priority,
      required this.status,
      required this.createdAt,
      required this.updatedAt,
      this.earliestStart,
      this.notes});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['title'] = Variable<String>(title);
    map['duration_minutes'] = Variable<int>(durationMinutes);
    map['deadline'] = Variable<DateTime>(deadline);
    map['priority'] = Variable<String>(priority);
    map['status'] = Variable<String>(status);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    if (!nullToAbsent || earliestStart != null) {
      map['earliest_start'] = Variable<DateTime>(earliestStart);
    }
    if (!nullToAbsent || notes != null) {
      map['notes'] = Variable<String>(notes);
    }
    return map;
  }

  PlannerTasksCompanion toCompanion(bool nullToAbsent) {
    return PlannerTasksCompanion(
      id: Value(id),
      title: Value(title),
      durationMinutes: Value(durationMinutes),
      deadline: Value(deadline),
      priority: Value(priority),
      status: Value(status),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      earliestStart: earliestStart == null && nullToAbsent
          ? const Value.absent()
          : Value(earliestStart),
      notes:
          notes == null && nullToAbsent ? const Value.absent() : Value(notes),
    );
  }

  factory PlannerTaskRow.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PlannerTaskRow(
      id: serializer.fromJson<String>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      durationMinutes: serializer.fromJson<int>(json['durationMinutes']),
      deadline: serializer.fromJson<DateTime>(json['deadline']),
      priority: serializer.fromJson<String>(json['priority']),
      status: serializer.fromJson<String>(json['status']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      earliestStart: serializer.fromJson<DateTime?>(json['earliestStart']),
      notes: serializer.fromJson<String?>(json['notes']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'title': serializer.toJson<String>(title),
      'durationMinutes': serializer.toJson<int>(durationMinutes),
      'deadline': serializer.toJson<DateTime>(deadline),
      'priority': serializer.toJson<String>(priority),
      'status': serializer.toJson<String>(status),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'earliestStart': serializer.toJson<DateTime?>(earliestStart),
      'notes': serializer.toJson<String?>(notes),
    };
  }

  PlannerTaskRow copyWith(
          {String? id,
          String? title,
          int? durationMinutes,
          DateTime? deadline,
          String? priority,
          String? status,
          DateTime? createdAt,
          DateTime? updatedAt,
          Value<DateTime?> earliestStart = const Value.absent(),
          Value<String?> notes = const Value.absent()}) =>
      PlannerTaskRow(
        id: id ?? this.id,
        title: title ?? this.title,
        durationMinutes: durationMinutes ?? this.durationMinutes,
        deadline: deadline ?? this.deadline,
        priority: priority ?? this.priority,
        status: status ?? this.status,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        earliestStart:
            earliestStart.present ? earliestStart.value : this.earliestStart,
        notes: notes.present ? notes.value : this.notes,
      );
  PlannerTaskRow copyWithCompanion(PlannerTasksCompanion data) {
    return PlannerTaskRow(
      id: data.id.present ? data.id.value : this.id,
      title: data.title.present ? data.title.value : this.title,
      durationMinutes: data.durationMinutes.present
          ? data.durationMinutes.value
          : this.durationMinutes,
      deadline: data.deadline.present ? data.deadline.value : this.deadline,
      priority: data.priority.present ? data.priority.value : this.priority,
      status: data.status.present ? data.status.value : this.status,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      earliestStart: data.earliestStart.present
          ? data.earliestStart.value
          : this.earliestStart,
      notes: data.notes.present ? data.notes.value : this.notes,
    );
  }

  @override
  String toString() {
    return (StringBuffer('PlannerTaskRow(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('durationMinutes: $durationMinutes, ')
          ..write('deadline: $deadline, ')
          ..write('priority: $priority, ')
          ..write('status: $status, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('earliestStart: $earliestStart, ')
          ..write('notes: $notes')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, title, durationMinutes, deadline,
      priority, status, createdAt, updatedAt, earliestStart, notes);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PlannerTaskRow &&
          other.id == this.id &&
          other.title == this.title &&
          other.durationMinutes == this.durationMinutes &&
          other.deadline == this.deadline &&
          other.priority == this.priority &&
          other.status == this.status &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.earliestStart == this.earliestStart &&
          other.notes == this.notes);
}

class PlannerTasksCompanion extends UpdateCompanion<PlannerTaskRow> {
  final Value<String> id;
  final Value<String> title;
  final Value<int> durationMinutes;
  final Value<DateTime> deadline;
  final Value<String> priority;
  final Value<String> status;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<DateTime?> earliestStart;
  final Value<String?> notes;
  final Value<int> rowid;
  const PlannerTasksCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.durationMinutes = const Value.absent(),
    this.deadline = const Value.absent(),
    this.priority = const Value.absent(),
    this.status = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.earliestStart = const Value.absent(),
    this.notes = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  PlannerTasksCompanion.insert({
    required String id,
    required String title,
    required int durationMinutes,
    required DateTime deadline,
    required String priority,
    required String status,
    required DateTime createdAt,
    required DateTime updatedAt,
    this.earliestStart = const Value.absent(),
    this.notes = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        title = Value(title),
        durationMinutes = Value(durationMinutes),
        deadline = Value(deadline),
        priority = Value(priority),
        status = Value(status),
        createdAt = Value(createdAt),
        updatedAt = Value(updatedAt);
  static Insertable<PlannerTaskRow> custom({
    Expression<String>? id,
    Expression<String>? title,
    Expression<int>? durationMinutes,
    Expression<DateTime>? deadline,
    Expression<String>? priority,
    Expression<String>? status,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<DateTime>? earliestStart,
    Expression<String>? notes,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (durationMinutes != null) 'duration_minutes': durationMinutes,
      if (deadline != null) 'deadline': deadline,
      if (priority != null) 'priority': priority,
      if (status != null) 'status': status,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (earliestStart != null) 'earliest_start': earliestStart,
      if (notes != null) 'notes': notes,
      if (rowid != null) 'rowid': rowid,
    });
  }

  PlannerTasksCompanion copyWith(
      {Value<String>? id,
      Value<String>? title,
      Value<int>? durationMinutes,
      Value<DateTime>? deadline,
      Value<String>? priority,
      Value<String>? status,
      Value<DateTime>? createdAt,
      Value<DateTime>? updatedAt,
      Value<DateTime?>? earliestStart,
      Value<String?>? notes,
      Value<int>? rowid}) {
    return PlannerTasksCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      durationMinutes: durationMinutes ?? this.durationMinutes,
      deadline: deadline ?? this.deadline,
      priority: priority ?? this.priority,
      status: status ?? this.status,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      earliestStart: earliestStart ?? this.earliestStart,
      notes: notes ?? this.notes,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (durationMinutes.present) {
      map['duration_minutes'] = Variable<int>(durationMinutes.value);
    }
    if (deadline.present) {
      map['deadline'] = Variable<DateTime>(deadline.value);
    }
    if (priority.present) {
      map['priority'] = Variable<String>(priority.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (earliestStart.present) {
      map['earliest_start'] = Variable<DateTime>(earliestStart.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PlannerTasksCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('durationMinutes: $durationMinutes, ')
          ..write('deadline: $deadline, ')
          ..write('priority: $priority, ')
          ..write('status: $status, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('earliestStart: $earliestStart, ')
          ..write('notes: $notes, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $UserProfilesTable userProfiles = $UserProfilesTable(this);
  late final $MemoriesTable memories = $MemoriesTable(this);
  late final $CalendarEventsTable calendarEvents = $CalendarEventsTable(this);
  late final $PlansTable plans = $PlansTable(this);
  late final $PlanBlocksTable planBlocks = $PlanBlocksTable(this);
  late final $AlarmsTable alarms = $AlarmsTable(this);
  late final $NotificationRowsTable notificationRows =
      $NotificationRowsTable(this);
  late final $ReminderRowsTable reminderRows = $ReminderRowsTable(this);
  late final $ReminderAuditRowsTable reminderAuditRows =
      $ReminderAuditRowsTable(this);
  late final $RouteProfilesTable routeProfiles = $RouteProfilesTable(this);
  late final $RouteObservationsTable routeObservations =
      $RouteObservationsTable(this);
  late final $WeatherEventsTable weatherEvents = $WeatherEventsTable(this);
  late final $PlannerTasksTable plannerTasks = $PlannerTasksTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
        userProfiles,
        memories,
        calendarEvents,
        plans,
        planBlocks,
        alarms,
        notificationRows,
        reminderRows,
        reminderAuditRows,
        routeProfiles,
        routeObservations,
        weatherEvents,
        plannerTasks
      ];
}

typedef $$UserProfilesTableCreateCompanionBuilder = UserProfilesCompanion
    Function({
  required String id,
  required String displayName,
  required String timezone,
  required String locale,
  required String preferredTone,
  required String preferredNotificationLevel,
  required int defaultTravelBufferMinutes,
  required int sleepStartHour,
  required int sleepStartMinute,
  required int sleepEndHour,
  required int sleepEndMinute,
  required int wakeStartHour,
  required int wakeStartMinute,
  required int wakeEndHour,
  required int wakeEndMinute,
  required DateTime createdAt,
  required DateTime updatedAt,
  Value<int> rowid,
});
typedef $$UserProfilesTableUpdateCompanionBuilder = UserProfilesCompanion
    Function({
  Value<String> id,
  Value<String> displayName,
  Value<String> timezone,
  Value<String> locale,
  Value<String> preferredTone,
  Value<String> preferredNotificationLevel,
  Value<int> defaultTravelBufferMinutes,
  Value<int> sleepStartHour,
  Value<int> sleepStartMinute,
  Value<int> sleepEndHour,
  Value<int> sleepEndMinute,
  Value<int> wakeStartHour,
  Value<int> wakeStartMinute,
  Value<int> wakeEndHour,
  Value<int> wakeEndMinute,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
  Value<int> rowid,
});

class $$UserProfilesTableFilterComposer
    extends Composer<_$AppDatabase, $UserProfilesTable> {
  $$UserProfilesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get displayName => $composableBuilder(
      column: $table.displayName, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get timezone => $composableBuilder(
      column: $table.timezone, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get locale => $composableBuilder(
      column: $table.locale, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get preferredTone => $composableBuilder(
      column: $table.preferredTone, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get preferredNotificationLevel => $composableBuilder(
      column: $table.preferredNotificationLevel,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get defaultTravelBufferMinutes => $composableBuilder(
      column: $table.defaultTravelBufferMinutes,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get sleepStartHour => $composableBuilder(
      column: $table.sleepStartHour,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get sleepStartMinute => $composableBuilder(
      column: $table.sleepStartMinute,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get sleepEndHour => $composableBuilder(
      column: $table.sleepEndHour, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get sleepEndMinute => $composableBuilder(
      column: $table.sleepEndMinute,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get wakeStartHour => $composableBuilder(
      column: $table.wakeStartHour, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get wakeStartMinute => $composableBuilder(
      column: $table.wakeStartMinute,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get wakeEndHour => $composableBuilder(
      column: $table.wakeEndHour, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get wakeEndMinute => $composableBuilder(
      column: $table.wakeEndMinute, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));
}

class $$UserProfilesTableOrderingComposer
    extends Composer<_$AppDatabase, $UserProfilesTable> {
  $$UserProfilesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get displayName => $composableBuilder(
      column: $table.displayName, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get timezone => $composableBuilder(
      column: $table.timezone, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get locale => $composableBuilder(
      column: $table.locale, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get preferredTone => $composableBuilder(
      column: $table.preferredTone,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get preferredNotificationLevel => $composableBuilder(
      column: $table.preferredNotificationLevel,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get defaultTravelBufferMinutes => $composableBuilder(
      column: $table.defaultTravelBufferMinutes,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get sleepStartHour => $composableBuilder(
      column: $table.sleepStartHour,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get sleepStartMinute => $composableBuilder(
      column: $table.sleepStartMinute,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get sleepEndHour => $composableBuilder(
      column: $table.sleepEndHour,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get sleepEndMinute => $composableBuilder(
      column: $table.sleepEndMinute,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get wakeStartHour => $composableBuilder(
      column: $table.wakeStartHour,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get wakeStartMinute => $composableBuilder(
      column: $table.wakeStartMinute,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get wakeEndHour => $composableBuilder(
      column: $table.wakeEndHour, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get wakeEndMinute => $composableBuilder(
      column: $table.wakeEndMinute,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));
}

class $$UserProfilesTableAnnotationComposer
    extends Composer<_$AppDatabase, $UserProfilesTable> {
  $$UserProfilesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get displayName => $composableBuilder(
      column: $table.displayName, builder: (column) => column);

  GeneratedColumn<String> get timezone =>
      $composableBuilder(column: $table.timezone, builder: (column) => column);

  GeneratedColumn<String> get locale =>
      $composableBuilder(column: $table.locale, builder: (column) => column);

  GeneratedColumn<String> get preferredTone => $composableBuilder(
      column: $table.preferredTone, builder: (column) => column);

  GeneratedColumn<String> get preferredNotificationLevel => $composableBuilder(
      column: $table.preferredNotificationLevel, builder: (column) => column);

  GeneratedColumn<int> get defaultTravelBufferMinutes => $composableBuilder(
      column: $table.defaultTravelBufferMinutes, builder: (column) => column);

  GeneratedColumn<int> get sleepStartHour => $composableBuilder(
      column: $table.sleepStartHour, builder: (column) => column);

  GeneratedColumn<int> get sleepStartMinute => $composableBuilder(
      column: $table.sleepStartMinute, builder: (column) => column);

  GeneratedColumn<int> get sleepEndHour => $composableBuilder(
      column: $table.sleepEndHour, builder: (column) => column);

  GeneratedColumn<int> get sleepEndMinute => $composableBuilder(
      column: $table.sleepEndMinute, builder: (column) => column);

  GeneratedColumn<int> get wakeStartHour => $composableBuilder(
      column: $table.wakeStartHour, builder: (column) => column);

  GeneratedColumn<int> get wakeStartMinute => $composableBuilder(
      column: $table.wakeStartMinute, builder: (column) => column);

  GeneratedColumn<int> get wakeEndHour => $composableBuilder(
      column: $table.wakeEndHour, builder: (column) => column);

  GeneratedColumn<int> get wakeEndMinute => $composableBuilder(
      column: $table.wakeEndMinute, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);
}

class $$UserProfilesTableTableManager extends RootTableManager<
    _$AppDatabase,
    $UserProfilesTable,
    UserProfileRow,
    $$UserProfilesTableFilterComposer,
    $$UserProfilesTableOrderingComposer,
    $$UserProfilesTableAnnotationComposer,
    $$UserProfilesTableCreateCompanionBuilder,
    $$UserProfilesTableUpdateCompanionBuilder,
    (
      UserProfileRow,
      BaseReferences<_$AppDatabase, $UserProfilesTable, UserProfileRow>
    ),
    UserProfileRow,
    PrefetchHooks Function()> {
  $$UserProfilesTableTableManager(_$AppDatabase db, $UserProfilesTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$UserProfilesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$UserProfilesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$UserProfilesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> displayName = const Value.absent(),
            Value<String> timezone = const Value.absent(),
            Value<String> locale = const Value.absent(),
            Value<String> preferredTone = const Value.absent(),
            Value<String> preferredNotificationLevel = const Value.absent(),
            Value<int> defaultTravelBufferMinutes = const Value.absent(),
            Value<int> sleepStartHour = const Value.absent(),
            Value<int> sleepStartMinute = const Value.absent(),
            Value<int> sleepEndHour = const Value.absent(),
            Value<int> sleepEndMinute = const Value.absent(),
            Value<int> wakeStartHour = const Value.absent(),
            Value<int> wakeStartMinute = const Value.absent(),
            Value<int> wakeEndHour = const Value.absent(),
            Value<int> wakeEndMinute = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              UserProfilesCompanion(
            id: id,
            displayName: displayName,
            timezone: timezone,
            locale: locale,
            preferredTone: preferredTone,
            preferredNotificationLevel: preferredNotificationLevel,
            defaultTravelBufferMinutes: defaultTravelBufferMinutes,
            sleepStartHour: sleepStartHour,
            sleepStartMinute: sleepStartMinute,
            sleepEndHour: sleepEndHour,
            sleepEndMinute: sleepEndMinute,
            wakeStartHour: wakeStartHour,
            wakeStartMinute: wakeStartMinute,
            wakeEndHour: wakeEndHour,
            wakeEndMinute: wakeEndMinute,
            createdAt: createdAt,
            updatedAt: updatedAt,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String displayName,
            required String timezone,
            required String locale,
            required String preferredTone,
            required String preferredNotificationLevel,
            required int defaultTravelBufferMinutes,
            required int sleepStartHour,
            required int sleepStartMinute,
            required int sleepEndHour,
            required int sleepEndMinute,
            required int wakeStartHour,
            required int wakeStartMinute,
            required int wakeEndHour,
            required int wakeEndMinute,
            required DateTime createdAt,
            required DateTime updatedAt,
            Value<int> rowid = const Value.absent(),
          }) =>
              UserProfilesCompanion.insert(
            id: id,
            displayName: displayName,
            timezone: timezone,
            locale: locale,
            preferredTone: preferredTone,
            preferredNotificationLevel: preferredNotificationLevel,
            defaultTravelBufferMinutes: defaultTravelBufferMinutes,
            sleepStartHour: sleepStartHour,
            sleepStartMinute: sleepStartMinute,
            sleepEndHour: sleepEndHour,
            sleepEndMinute: sleepEndMinute,
            wakeStartHour: wakeStartHour,
            wakeStartMinute: wakeStartMinute,
            wakeEndHour: wakeEndHour,
            wakeEndMinute: wakeEndMinute,
            createdAt: createdAt,
            updatedAt: updatedAt,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable<$UserProfilesTable, UserProfileRow>(table),
                    BaseReferences<_$AppDatabase, $UserProfilesTable,
                        UserProfileRow>(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$UserProfilesTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $UserProfilesTable,
    UserProfileRow,
    $$UserProfilesTableFilterComposer,
    $$UserProfilesTableOrderingComposer,
    $$UserProfilesTableAnnotationComposer,
    $$UserProfilesTableCreateCompanionBuilder,
    $$UserProfilesTableUpdateCompanionBuilder,
    (
      UserProfileRow,
      BaseReferences<_$AppDatabase, $UserProfilesTable, UserProfileRow>
    ),
    UserProfileRow,
    PrefetchHooks Function()>;
typedef $$MemoriesTableCreateCompanionBuilder = MemoriesCompanion Function({
  required String id,
  required String type,
  required String title,
  required String value,
  required String source,
  required String confidence,
  Value<String?> condition,
  Value<DateTime?> expiresAt,
  Value<DateTime?> lastUsedAt,
  required DateTime createdAt,
  required DateTime updatedAt,
  Value<int> rowid,
});
typedef $$MemoriesTableUpdateCompanionBuilder = MemoriesCompanion Function({
  Value<String> id,
  Value<String> type,
  Value<String> title,
  Value<String> value,
  Value<String> source,
  Value<String> confidence,
  Value<String?> condition,
  Value<DateTime?> expiresAt,
  Value<DateTime?> lastUsedAt,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
  Value<int> rowid,
});

class $$MemoriesTableFilterComposer
    extends Composer<_$AppDatabase, $MemoriesTable> {
  $$MemoriesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get type => $composableBuilder(
      column: $table.type, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get value => $composableBuilder(
      column: $table.value, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get source => $composableBuilder(
      column: $table.source, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get confidence => $composableBuilder(
      column: $table.confidence, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get condition => $composableBuilder(
      column: $table.condition, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get expiresAt => $composableBuilder(
      column: $table.expiresAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get lastUsedAt => $composableBuilder(
      column: $table.lastUsedAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));
}

class $$MemoriesTableOrderingComposer
    extends Composer<_$AppDatabase, $MemoriesTable> {
  $$MemoriesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get type => $composableBuilder(
      column: $table.type, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get value => $composableBuilder(
      column: $table.value, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get source => $composableBuilder(
      column: $table.source, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get confidence => $composableBuilder(
      column: $table.confidence, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get condition => $composableBuilder(
      column: $table.condition, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get expiresAt => $composableBuilder(
      column: $table.expiresAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get lastUsedAt => $composableBuilder(
      column: $table.lastUsedAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));
}

class $$MemoriesTableAnnotationComposer
    extends Composer<_$AppDatabase, $MemoriesTable> {
  $$MemoriesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get type =>
      $composableBuilder(column: $table.type, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get value =>
      $composableBuilder(column: $table.value, builder: (column) => column);

  GeneratedColumn<String> get source =>
      $composableBuilder(column: $table.source, builder: (column) => column);

  GeneratedColumn<String> get confidence => $composableBuilder(
      column: $table.confidence, builder: (column) => column);

  GeneratedColumn<String> get condition =>
      $composableBuilder(column: $table.condition, builder: (column) => column);

  GeneratedColumn<DateTime> get expiresAt =>
      $composableBuilder(column: $table.expiresAt, builder: (column) => column);

  GeneratedColumn<DateTime> get lastUsedAt => $composableBuilder(
      column: $table.lastUsedAt, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);
}

class $$MemoriesTableTableManager extends RootTableManager<
    _$AppDatabase,
    $MemoriesTable,
    MemoryRow,
    $$MemoriesTableFilterComposer,
    $$MemoriesTableOrderingComposer,
    $$MemoriesTableAnnotationComposer,
    $$MemoriesTableCreateCompanionBuilder,
    $$MemoriesTableUpdateCompanionBuilder,
    (MemoryRow, BaseReferences<_$AppDatabase, $MemoriesTable, MemoryRow>),
    MemoryRow,
    PrefetchHooks Function()> {
  $$MemoriesTableTableManager(_$AppDatabase db, $MemoriesTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$MemoriesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$MemoriesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$MemoriesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> type = const Value.absent(),
            Value<String> title = const Value.absent(),
            Value<String> value = const Value.absent(),
            Value<String> source = const Value.absent(),
            Value<String> confidence = const Value.absent(),
            Value<String?> condition = const Value.absent(),
            Value<DateTime?> expiresAt = const Value.absent(),
            Value<DateTime?> lastUsedAt = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              MemoriesCompanion(
            id: id,
            type: type,
            title: title,
            value: value,
            source: source,
            confidence: confidence,
            condition: condition,
            expiresAt: expiresAt,
            lastUsedAt: lastUsedAt,
            createdAt: createdAt,
            updatedAt: updatedAt,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String type,
            required String title,
            required String value,
            required String source,
            required String confidence,
            Value<String?> condition = const Value.absent(),
            Value<DateTime?> expiresAt = const Value.absent(),
            Value<DateTime?> lastUsedAt = const Value.absent(),
            required DateTime createdAt,
            required DateTime updatedAt,
            Value<int> rowid = const Value.absent(),
          }) =>
              MemoriesCompanion.insert(
            id: id,
            type: type,
            title: title,
            value: value,
            source: source,
            confidence: confidence,
            condition: condition,
            expiresAt: expiresAt,
            lastUsedAt: lastUsedAt,
            createdAt: createdAt,
            updatedAt: updatedAt,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable<$MemoriesTable, MemoryRow>(table),
                    BaseReferences<_$AppDatabase, $MemoriesTable, MemoryRow>(
                        db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$MemoriesTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $MemoriesTable,
    MemoryRow,
    $$MemoriesTableFilterComposer,
    $$MemoriesTableOrderingComposer,
    $$MemoriesTableAnnotationComposer,
    $$MemoriesTableCreateCompanionBuilder,
    $$MemoriesTableUpdateCompanionBuilder,
    (MemoryRow, BaseReferences<_$AppDatabase, $MemoriesTable, MemoryRow>),
    MemoryRow,
    PrefetchHooks Function()>;
typedef $$CalendarEventsTableCreateCompanionBuilder = CalendarEventsCompanion
    Function({
  required String id,
  required String title,
  required DateTime startsAt,
  required DateTime endsAt,
  Value<String?> locationName,
  Value<int> rowid,
});
typedef $$CalendarEventsTableUpdateCompanionBuilder = CalendarEventsCompanion
    Function({
  Value<String> id,
  Value<String> title,
  Value<DateTime> startsAt,
  Value<DateTime> endsAt,
  Value<String?> locationName,
  Value<int> rowid,
});

class $$CalendarEventsTableFilterComposer
    extends Composer<_$AppDatabase, $CalendarEventsTable> {
  $$CalendarEventsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get startsAt => $composableBuilder(
      column: $table.startsAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get endsAt => $composableBuilder(
      column: $table.endsAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get locationName => $composableBuilder(
      column: $table.locationName, builder: (column) => ColumnFilters(column));
}

class $$CalendarEventsTableOrderingComposer
    extends Composer<_$AppDatabase, $CalendarEventsTable> {
  $$CalendarEventsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get startsAt => $composableBuilder(
      column: $table.startsAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get endsAt => $composableBuilder(
      column: $table.endsAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get locationName => $composableBuilder(
      column: $table.locationName,
      builder: (column) => ColumnOrderings(column));
}

class $$CalendarEventsTableAnnotationComposer
    extends Composer<_$AppDatabase, $CalendarEventsTable> {
  $$CalendarEventsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<DateTime> get startsAt =>
      $composableBuilder(column: $table.startsAt, builder: (column) => column);

  GeneratedColumn<DateTime> get endsAt =>
      $composableBuilder(column: $table.endsAt, builder: (column) => column);

  GeneratedColumn<String> get locationName => $composableBuilder(
      column: $table.locationName, builder: (column) => column);
}

class $$CalendarEventsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $CalendarEventsTable,
    CalendarEventRow,
    $$CalendarEventsTableFilterComposer,
    $$CalendarEventsTableOrderingComposer,
    $$CalendarEventsTableAnnotationComposer,
    $$CalendarEventsTableCreateCompanionBuilder,
    $$CalendarEventsTableUpdateCompanionBuilder,
    (
      CalendarEventRow,
      BaseReferences<_$AppDatabase, $CalendarEventsTable, CalendarEventRow>
    ),
    CalendarEventRow,
    PrefetchHooks Function()> {
  $$CalendarEventsTableTableManager(
      _$AppDatabase db, $CalendarEventsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CalendarEventsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CalendarEventsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CalendarEventsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> title = const Value.absent(),
            Value<DateTime> startsAt = const Value.absent(),
            Value<DateTime> endsAt = const Value.absent(),
            Value<String?> locationName = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              CalendarEventsCompanion(
            id: id,
            title: title,
            startsAt: startsAt,
            endsAt: endsAt,
            locationName: locationName,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String title,
            required DateTime startsAt,
            required DateTime endsAt,
            Value<String?> locationName = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              CalendarEventsCompanion.insert(
            id: id,
            title: title,
            startsAt: startsAt,
            endsAt: endsAt,
            locationName: locationName,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable<$CalendarEventsTable, CalendarEventRow>(table),
                    BaseReferences<_$AppDatabase, $CalendarEventsTable,
                        CalendarEventRow>(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$CalendarEventsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $CalendarEventsTable,
    CalendarEventRow,
    $$CalendarEventsTableFilterComposer,
    $$CalendarEventsTableOrderingComposer,
    $$CalendarEventsTableAnnotationComposer,
    $$CalendarEventsTableCreateCompanionBuilder,
    $$CalendarEventsTableUpdateCompanionBuilder,
    (
      CalendarEventRow,
      BaseReferences<_$AppDatabase, $CalendarEventsTable, CalendarEventRow>
    ),
    CalendarEventRow,
    PrefetchHooks Function()>;
typedef $$PlansTableCreateCompanionBuilder = PlansCompanion Function({
  required String id,
  required DateTime date,
  required String evidenceIds,
  required DateTime createdAt,
  required DateTime updatedAt,
  Value<int> rowid,
});
typedef $$PlansTableUpdateCompanionBuilder = PlansCompanion Function({
  Value<String> id,
  Value<DateTime> date,
  Value<String> evidenceIds,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
  Value<int> rowid,
});

final class $$PlansTableReferences
    extends BaseReferences<_$AppDatabase, $PlansTable, PlanRow> {
  $$PlansTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$PlanBlocksTable, List<PlanBlockRow>>
      _planBlocksRefsTable(_$AppDatabase db) =>
          MultiTypedResultKey.fromTable(db.planBlocks,
              aliasName: 'plans__id__plan_blocks__plan_id');

  $$PlanBlocksTableProcessedTableManager get planBlocksRefs {
    final manager = $$PlanBlocksTableTableManager($_db, $_db.planBlocks)
        .filter((f) => f.planId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_planBlocksRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$PlansTableFilterComposer extends Composer<_$AppDatabase, $PlansTable> {
  $$PlansTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get date => $composableBuilder(
      column: $table.date, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get evidenceIds => $composableBuilder(
      column: $table.evidenceIds, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));

  Expression<bool> planBlocksRefs(
      Expression<bool> Function($$PlanBlocksTableFilterComposer f) f) {
    final $$PlanBlocksTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.planBlocks,
        getReferencedColumn: (t) => t.planId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$PlanBlocksTableFilterComposer(
              $db: $db,
              $table: $db.planBlocks,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$PlansTableOrderingComposer
    extends Composer<_$AppDatabase, $PlansTable> {
  $$PlansTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get date => $composableBuilder(
      column: $table.date, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get evidenceIds => $composableBuilder(
      column: $table.evidenceIds, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));
}

class $$PlansTableAnnotationComposer
    extends Composer<_$AppDatabase, $PlansTable> {
  $$PlansTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get date =>
      $composableBuilder(column: $table.date, builder: (column) => column);

  GeneratedColumn<String> get evidenceIds => $composableBuilder(
      column: $table.evidenceIds, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  Expression<T> planBlocksRefs<T extends Object>(
      Expression<T> Function($$PlanBlocksTableAnnotationComposer a) f) {
    final $$PlanBlocksTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.planBlocks,
        getReferencedColumn: (t) => t.planId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$PlanBlocksTableAnnotationComposer(
              $db: $db,
              $table: $db.planBlocks,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$PlansTableTableManager extends RootTableManager<
    _$AppDatabase,
    $PlansTable,
    PlanRow,
    $$PlansTableFilterComposer,
    $$PlansTableOrderingComposer,
    $$PlansTableAnnotationComposer,
    $$PlansTableCreateCompanionBuilder,
    $$PlansTableUpdateCompanionBuilder,
    (PlanRow, $$PlansTableReferences),
    PlanRow,
    PrefetchHooks Function({bool planBlocksRefs})> {
  $$PlansTableTableManager(_$AppDatabase db, $PlansTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PlansTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$PlansTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$PlansTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<DateTime> date = const Value.absent(),
            Value<String> evidenceIds = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              PlansCompanion(
            id: id,
            date: date,
            evidenceIds: evidenceIds,
            createdAt: createdAt,
            updatedAt: updatedAt,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required DateTime date,
            required String evidenceIds,
            required DateTime createdAt,
            required DateTime updatedAt,
            Value<int> rowid = const Value.absent(),
          }) =>
              PlansCompanion.insert(
            id: id,
            date: date,
            evidenceIds: evidenceIds,
            createdAt: createdAt,
            updatedAt: updatedAt,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable<$PlansTable, PlanRow>(table),
                    $$PlansTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({planBlocksRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (planBlocksRefs) db.planBlocks],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (planBlocksRefs)
                    await $_getPrefetchedData<PlanRow, $PlansTable,
                            PlanBlockRow>(
                        currentTable: table,
                        referencedTable:
                            $$PlansTableReferences._planBlocksRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$PlansTableReferences(db, table, p0)
                                .planBlocksRefs,
                        referencedItemsForCurrentItem: (item,
                                referencedItems) =>
                            referencedItems.where((e) => e.planId == item.id),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$PlansTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $PlansTable,
    PlanRow,
    $$PlansTableFilterComposer,
    $$PlansTableOrderingComposer,
    $$PlansTableAnnotationComposer,
    $$PlansTableCreateCompanionBuilder,
    $$PlansTableUpdateCompanionBuilder,
    (PlanRow, $$PlansTableReferences),
    PlanRow,
    PrefetchHooks Function({bool planBlocksRefs})>;
typedef $$PlanBlocksTableCreateCompanionBuilder = PlanBlocksCompanion Function({
  required String id,
  required String planId,
  required String type,
  required String title,
  required DateTime startsAt,
  required DateTime endsAt,
  required String evidenceIds,
  Value<int> rowid,
});
typedef $$PlanBlocksTableUpdateCompanionBuilder = PlanBlocksCompanion Function({
  Value<String> id,
  Value<String> planId,
  Value<String> type,
  Value<String> title,
  Value<DateTime> startsAt,
  Value<DateTime> endsAt,
  Value<String> evidenceIds,
  Value<int> rowid,
});

final class $$PlanBlocksTableReferences
    extends BaseReferences<_$AppDatabase, $PlanBlocksTable, PlanBlockRow> {
  $$PlanBlocksTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $PlansTable _planIdTable(_$AppDatabase db) =>
      db.plans.createAlias('plan_blocks__plan_id__plans__id');

  $$PlansTableProcessedTableManager get planId {
    final $_column = $_itemColumn<String>('plan_id')!;

    final manager = $$PlansTableTableManager($_db, $_db.plans)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_planIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$PlanBlocksTableFilterComposer
    extends Composer<_$AppDatabase, $PlanBlocksTable> {
  $$PlanBlocksTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get type => $composableBuilder(
      column: $table.type, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get startsAt => $composableBuilder(
      column: $table.startsAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get endsAt => $composableBuilder(
      column: $table.endsAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get evidenceIds => $composableBuilder(
      column: $table.evidenceIds, builder: (column) => ColumnFilters(column));

  $$PlansTableFilterComposer get planId {
    final $$PlansTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.planId,
        referencedTable: $db.plans,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$PlansTableFilterComposer(
              $db: $db,
              $table: $db.plans,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$PlanBlocksTableOrderingComposer
    extends Composer<_$AppDatabase, $PlanBlocksTable> {
  $$PlanBlocksTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get type => $composableBuilder(
      column: $table.type, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get startsAt => $composableBuilder(
      column: $table.startsAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get endsAt => $composableBuilder(
      column: $table.endsAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get evidenceIds => $composableBuilder(
      column: $table.evidenceIds, builder: (column) => ColumnOrderings(column));

  $$PlansTableOrderingComposer get planId {
    final $$PlansTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.planId,
        referencedTable: $db.plans,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$PlansTableOrderingComposer(
              $db: $db,
              $table: $db.plans,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$PlanBlocksTableAnnotationComposer
    extends Composer<_$AppDatabase, $PlanBlocksTable> {
  $$PlanBlocksTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get type =>
      $composableBuilder(column: $table.type, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<DateTime> get startsAt =>
      $composableBuilder(column: $table.startsAt, builder: (column) => column);

  GeneratedColumn<DateTime> get endsAt =>
      $composableBuilder(column: $table.endsAt, builder: (column) => column);

  GeneratedColumn<String> get evidenceIds => $composableBuilder(
      column: $table.evidenceIds, builder: (column) => column);

  $$PlansTableAnnotationComposer get planId {
    final $$PlansTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.planId,
        referencedTable: $db.plans,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$PlansTableAnnotationComposer(
              $db: $db,
              $table: $db.plans,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$PlanBlocksTableTableManager extends RootTableManager<
    _$AppDatabase,
    $PlanBlocksTable,
    PlanBlockRow,
    $$PlanBlocksTableFilterComposer,
    $$PlanBlocksTableOrderingComposer,
    $$PlanBlocksTableAnnotationComposer,
    $$PlanBlocksTableCreateCompanionBuilder,
    $$PlanBlocksTableUpdateCompanionBuilder,
    (PlanBlockRow, $$PlanBlocksTableReferences),
    PlanBlockRow,
    PrefetchHooks Function({bool planId})> {
  $$PlanBlocksTableTableManager(_$AppDatabase db, $PlanBlocksTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PlanBlocksTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$PlanBlocksTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$PlanBlocksTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> planId = const Value.absent(),
            Value<String> type = const Value.absent(),
            Value<String> title = const Value.absent(),
            Value<DateTime> startsAt = const Value.absent(),
            Value<DateTime> endsAt = const Value.absent(),
            Value<String> evidenceIds = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              PlanBlocksCompanion(
            id: id,
            planId: planId,
            type: type,
            title: title,
            startsAt: startsAt,
            endsAt: endsAt,
            evidenceIds: evidenceIds,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String planId,
            required String type,
            required String title,
            required DateTime startsAt,
            required DateTime endsAt,
            required String evidenceIds,
            Value<int> rowid = const Value.absent(),
          }) =>
              PlanBlocksCompanion.insert(
            id: id,
            planId: planId,
            type: type,
            title: title,
            startsAt: startsAt,
            endsAt: endsAt,
            evidenceIds: evidenceIds,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable<$PlanBlocksTable, PlanBlockRow>(table),
                    $$PlanBlocksTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({planId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (planId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.planId,
                    referencedTable:
                        $$PlanBlocksTableReferences._planIdTable(db),
                    referencedColumn:
                        $$PlanBlocksTableReferences._planIdTable(db).id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ));
}

typedef $$PlanBlocksTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $PlanBlocksTable,
    PlanBlockRow,
    $$PlanBlocksTableFilterComposer,
    $$PlanBlocksTableOrderingComposer,
    $$PlanBlocksTableAnnotationComposer,
    $$PlanBlocksTableCreateCompanionBuilder,
    $$PlanBlocksTableUpdateCompanionBuilder,
    (PlanBlockRow, $$PlanBlocksTableReferences),
    PlanBlockRow,
    PrefetchHooks Function({bool planId})>;
typedef $$AlarmsTableCreateCompanionBuilder = AlarmsCompanion Function({
  required String id,
  required DateTime scheduledFor,
  required String reason,
  required String evidenceIds,
  required int calculationVersion,
  required bool isActive,
  Value<int> rowid,
});
typedef $$AlarmsTableUpdateCompanionBuilder = AlarmsCompanion Function({
  Value<String> id,
  Value<DateTime> scheduledFor,
  Value<String> reason,
  Value<String> evidenceIds,
  Value<int> calculationVersion,
  Value<bool> isActive,
  Value<int> rowid,
});

class $$AlarmsTableFilterComposer
    extends Composer<_$AppDatabase, $AlarmsTable> {
  $$AlarmsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get scheduledFor => $composableBuilder(
      column: $table.scheduledFor, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get reason => $composableBuilder(
      column: $table.reason, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get evidenceIds => $composableBuilder(
      column: $table.evidenceIds, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get calculationVersion => $composableBuilder(
      column: $table.calculationVersion,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isActive => $composableBuilder(
      column: $table.isActive, builder: (column) => ColumnFilters(column));
}

class $$AlarmsTableOrderingComposer
    extends Composer<_$AppDatabase, $AlarmsTable> {
  $$AlarmsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get scheduledFor => $composableBuilder(
      column: $table.scheduledFor,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get reason => $composableBuilder(
      column: $table.reason, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get evidenceIds => $composableBuilder(
      column: $table.evidenceIds, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get calculationVersion => $composableBuilder(
      column: $table.calculationVersion,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isActive => $composableBuilder(
      column: $table.isActive, builder: (column) => ColumnOrderings(column));
}

class $$AlarmsTableAnnotationComposer
    extends Composer<_$AppDatabase, $AlarmsTable> {
  $$AlarmsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get scheduledFor => $composableBuilder(
      column: $table.scheduledFor, builder: (column) => column);

  GeneratedColumn<String> get reason =>
      $composableBuilder(column: $table.reason, builder: (column) => column);

  GeneratedColumn<String> get evidenceIds => $composableBuilder(
      column: $table.evidenceIds, builder: (column) => column);

  GeneratedColumn<int> get calculationVersion => $composableBuilder(
      column: $table.calculationVersion, builder: (column) => column);

  GeneratedColumn<bool> get isActive =>
      $composableBuilder(column: $table.isActive, builder: (column) => column);
}

class $$AlarmsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $AlarmsTable,
    AlarmRow,
    $$AlarmsTableFilterComposer,
    $$AlarmsTableOrderingComposer,
    $$AlarmsTableAnnotationComposer,
    $$AlarmsTableCreateCompanionBuilder,
    $$AlarmsTableUpdateCompanionBuilder,
    (AlarmRow, BaseReferences<_$AppDatabase, $AlarmsTable, AlarmRow>),
    AlarmRow,
    PrefetchHooks Function()> {
  $$AlarmsTableTableManager(_$AppDatabase db, $AlarmsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$AlarmsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$AlarmsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$AlarmsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<DateTime> scheduledFor = const Value.absent(),
            Value<String> reason = const Value.absent(),
            Value<String> evidenceIds = const Value.absent(),
            Value<int> calculationVersion = const Value.absent(),
            Value<bool> isActive = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              AlarmsCompanion(
            id: id,
            scheduledFor: scheduledFor,
            reason: reason,
            evidenceIds: evidenceIds,
            calculationVersion: calculationVersion,
            isActive: isActive,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required DateTime scheduledFor,
            required String reason,
            required String evidenceIds,
            required int calculationVersion,
            required bool isActive,
            Value<int> rowid = const Value.absent(),
          }) =>
              AlarmsCompanion.insert(
            id: id,
            scheduledFor: scheduledFor,
            reason: reason,
            evidenceIds: evidenceIds,
            calculationVersion: calculationVersion,
            isActive: isActive,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable<$AlarmsTable, AlarmRow>(table),
                    BaseReferences<_$AppDatabase, $AlarmsTable, AlarmRow>(
                        db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$AlarmsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $AlarmsTable,
    AlarmRow,
    $$AlarmsTableFilterComposer,
    $$AlarmsTableOrderingComposer,
    $$AlarmsTableAnnotationComposer,
    $$AlarmsTableCreateCompanionBuilder,
    $$AlarmsTableUpdateCompanionBuilder,
    (AlarmRow, BaseReferences<_$AppDatabase, $AlarmsTable, AlarmRow>),
    AlarmRow,
    PrefetchHooks Function()>;
typedef $$NotificationRowsTableCreateCompanionBuilder
    = NotificationRowsCompanion Function({
  required String id,
  required String fingerprint,
  required String priority,
  required String title,
  required String body,
  required DateTime createdAt,
  required String evidenceIds,
  Value<int> rowid,
});
typedef $$NotificationRowsTableUpdateCompanionBuilder
    = NotificationRowsCompanion Function({
  Value<String> id,
  Value<String> fingerprint,
  Value<String> priority,
  Value<String> title,
  Value<String> body,
  Value<DateTime> createdAt,
  Value<String> evidenceIds,
  Value<int> rowid,
});

class $$NotificationRowsTableFilterComposer
    extends Composer<_$AppDatabase, $NotificationRowsTable> {
  $$NotificationRowsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get fingerprint => $composableBuilder(
      column: $table.fingerprint, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get priority => $composableBuilder(
      column: $table.priority, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get body => $composableBuilder(
      column: $table.body, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get evidenceIds => $composableBuilder(
      column: $table.evidenceIds, builder: (column) => ColumnFilters(column));
}

class $$NotificationRowsTableOrderingComposer
    extends Composer<_$AppDatabase, $NotificationRowsTable> {
  $$NotificationRowsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get fingerprint => $composableBuilder(
      column: $table.fingerprint, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get priority => $composableBuilder(
      column: $table.priority, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get body => $composableBuilder(
      column: $table.body, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get evidenceIds => $composableBuilder(
      column: $table.evidenceIds, builder: (column) => ColumnOrderings(column));
}

class $$NotificationRowsTableAnnotationComposer
    extends Composer<_$AppDatabase, $NotificationRowsTable> {
  $$NotificationRowsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get fingerprint => $composableBuilder(
      column: $table.fingerprint, builder: (column) => column);

  GeneratedColumn<String> get priority =>
      $composableBuilder(column: $table.priority, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get body =>
      $composableBuilder(column: $table.body, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<String> get evidenceIds => $composableBuilder(
      column: $table.evidenceIds, builder: (column) => column);
}

class $$NotificationRowsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $NotificationRowsTable,
    NotificationRecord,
    $$NotificationRowsTableFilterComposer,
    $$NotificationRowsTableOrderingComposer,
    $$NotificationRowsTableAnnotationComposer,
    $$NotificationRowsTableCreateCompanionBuilder,
    $$NotificationRowsTableUpdateCompanionBuilder,
    (
      NotificationRecord,
      BaseReferences<_$AppDatabase, $NotificationRowsTable, NotificationRecord>
    ),
    NotificationRecord,
    PrefetchHooks Function()> {
  $$NotificationRowsTableTableManager(
      _$AppDatabase db, $NotificationRowsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$NotificationRowsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$NotificationRowsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$NotificationRowsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> fingerprint = const Value.absent(),
            Value<String> priority = const Value.absent(),
            Value<String> title = const Value.absent(),
            Value<String> body = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<String> evidenceIds = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              NotificationRowsCompanion(
            id: id,
            fingerprint: fingerprint,
            priority: priority,
            title: title,
            body: body,
            createdAt: createdAt,
            evidenceIds: evidenceIds,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String fingerprint,
            required String priority,
            required String title,
            required String body,
            required DateTime createdAt,
            required String evidenceIds,
            Value<int> rowid = const Value.absent(),
          }) =>
              NotificationRowsCompanion.insert(
            id: id,
            fingerprint: fingerprint,
            priority: priority,
            title: title,
            body: body,
            createdAt: createdAt,
            evidenceIds: evidenceIds,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable<$NotificationRowsTable, NotificationRecord>(
                        table),
                    BaseReferences<_$AppDatabase, $NotificationRowsTable,
                        NotificationRecord>(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$NotificationRowsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $NotificationRowsTable,
    NotificationRecord,
    $$NotificationRowsTableFilterComposer,
    $$NotificationRowsTableOrderingComposer,
    $$NotificationRowsTableAnnotationComposer,
    $$NotificationRowsTableCreateCompanionBuilder,
    $$NotificationRowsTableUpdateCompanionBuilder,
    (
      NotificationRecord,
      BaseReferences<_$AppDatabase, $NotificationRowsTable, NotificationRecord>
    ),
    NotificationRecord,
    PrefetchHooks Function()>;
typedef $$ReminderRowsTableCreateCompanionBuilder = ReminderRowsCompanion
    Function({
  required String key,
  required int notificationId,
  required String ownerId,
  required String kind,
  required DateTime scheduledFor,
  required String title,
  required String body,
  required String evidence,
  required String evidenceIds,
  required String status,
  required DateTime updatedAt,
  Value<int> rowid,
});
typedef $$ReminderRowsTableUpdateCompanionBuilder = ReminderRowsCompanion
    Function({
  Value<String> key,
  Value<int> notificationId,
  Value<String> ownerId,
  Value<String> kind,
  Value<DateTime> scheduledFor,
  Value<String> title,
  Value<String> body,
  Value<String> evidence,
  Value<String> evidenceIds,
  Value<String> status,
  Value<DateTime> updatedAt,
  Value<int> rowid,
});

class $$ReminderRowsTableFilterComposer
    extends Composer<_$AppDatabase, $ReminderRowsTable> {
  $$ReminderRowsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get key => $composableBuilder(
      column: $table.key, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get notificationId => $composableBuilder(
      column: $table.notificationId,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get ownerId => $composableBuilder(
      column: $table.ownerId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get kind => $composableBuilder(
      column: $table.kind, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get scheduledFor => $composableBuilder(
      column: $table.scheduledFor, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get body => $composableBuilder(
      column: $table.body, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get evidence => $composableBuilder(
      column: $table.evidence, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get evidenceIds => $composableBuilder(
      column: $table.evidenceIds, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get status => $composableBuilder(
      column: $table.status, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));
}

class $$ReminderRowsTableOrderingComposer
    extends Composer<_$AppDatabase, $ReminderRowsTable> {
  $$ReminderRowsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get key => $composableBuilder(
      column: $table.key, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get notificationId => $composableBuilder(
      column: $table.notificationId,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get ownerId => $composableBuilder(
      column: $table.ownerId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get kind => $composableBuilder(
      column: $table.kind, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get scheduledFor => $composableBuilder(
      column: $table.scheduledFor,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get body => $composableBuilder(
      column: $table.body, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get evidence => $composableBuilder(
      column: $table.evidence, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get evidenceIds => $composableBuilder(
      column: $table.evidenceIds, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get status => $composableBuilder(
      column: $table.status, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));
}

class $$ReminderRowsTableAnnotationComposer
    extends Composer<_$AppDatabase, $ReminderRowsTable> {
  $$ReminderRowsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get key =>
      $composableBuilder(column: $table.key, builder: (column) => column);

  GeneratedColumn<int> get notificationId => $composableBuilder(
      column: $table.notificationId, builder: (column) => column);

  GeneratedColumn<String> get ownerId =>
      $composableBuilder(column: $table.ownerId, builder: (column) => column);

  GeneratedColumn<String> get kind =>
      $composableBuilder(column: $table.kind, builder: (column) => column);

  GeneratedColumn<DateTime> get scheduledFor => $composableBuilder(
      column: $table.scheduledFor, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get body =>
      $composableBuilder(column: $table.body, builder: (column) => column);

  GeneratedColumn<String> get evidence =>
      $composableBuilder(column: $table.evidence, builder: (column) => column);

  GeneratedColumn<String> get evidenceIds => $composableBuilder(
      column: $table.evidenceIds, builder: (column) => column);

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);
}

class $$ReminderRowsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $ReminderRowsTable,
    ReminderRow,
    $$ReminderRowsTableFilterComposer,
    $$ReminderRowsTableOrderingComposer,
    $$ReminderRowsTableAnnotationComposer,
    $$ReminderRowsTableCreateCompanionBuilder,
    $$ReminderRowsTableUpdateCompanionBuilder,
    (
      ReminderRow,
      BaseReferences<_$AppDatabase, $ReminderRowsTable, ReminderRow>
    ),
    ReminderRow,
    PrefetchHooks Function()> {
  $$ReminderRowsTableTableManager(_$AppDatabase db, $ReminderRowsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ReminderRowsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ReminderRowsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ReminderRowsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> key = const Value.absent(),
            Value<int> notificationId = const Value.absent(),
            Value<String> ownerId = const Value.absent(),
            Value<String> kind = const Value.absent(),
            Value<DateTime> scheduledFor = const Value.absent(),
            Value<String> title = const Value.absent(),
            Value<String> body = const Value.absent(),
            Value<String> evidence = const Value.absent(),
            Value<String> evidenceIds = const Value.absent(),
            Value<String> status = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              ReminderRowsCompanion(
            key: key,
            notificationId: notificationId,
            ownerId: ownerId,
            kind: kind,
            scheduledFor: scheduledFor,
            title: title,
            body: body,
            evidence: evidence,
            evidenceIds: evidenceIds,
            status: status,
            updatedAt: updatedAt,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String key,
            required int notificationId,
            required String ownerId,
            required String kind,
            required DateTime scheduledFor,
            required String title,
            required String body,
            required String evidence,
            required String evidenceIds,
            required String status,
            required DateTime updatedAt,
            Value<int> rowid = const Value.absent(),
          }) =>
              ReminderRowsCompanion.insert(
            key: key,
            notificationId: notificationId,
            ownerId: ownerId,
            kind: kind,
            scheduledFor: scheduledFor,
            title: title,
            body: body,
            evidence: evidence,
            evidenceIds: evidenceIds,
            status: status,
            updatedAt: updatedAt,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable<$ReminderRowsTable, ReminderRow>(table),
                    BaseReferences<_$AppDatabase, $ReminderRowsTable,
                        ReminderRow>(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$ReminderRowsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $ReminderRowsTable,
    ReminderRow,
    $$ReminderRowsTableFilterComposer,
    $$ReminderRowsTableOrderingComposer,
    $$ReminderRowsTableAnnotationComposer,
    $$ReminderRowsTableCreateCompanionBuilder,
    $$ReminderRowsTableUpdateCompanionBuilder,
    (
      ReminderRow,
      BaseReferences<_$AppDatabase, $ReminderRowsTable, ReminderRow>
    ),
    ReminderRow,
    PrefetchHooks Function()>;
typedef $$ReminderAuditRowsTableCreateCompanionBuilder
    = ReminderAuditRowsCompanion Function({
  required String id,
  required String reminderKey,
  required String operation,
  required String explanation,
  required DateTime createdAt,
  Value<int> rowid,
});
typedef $$ReminderAuditRowsTableUpdateCompanionBuilder
    = ReminderAuditRowsCompanion Function({
  Value<String> id,
  Value<String> reminderKey,
  Value<String> operation,
  Value<String> explanation,
  Value<DateTime> createdAt,
  Value<int> rowid,
});

class $$ReminderAuditRowsTableFilterComposer
    extends Composer<_$AppDatabase, $ReminderAuditRowsTable> {
  $$ReminderAuditRowsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get reminderKey => $composableBuilder(
      column: $table.reminderKey, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get operation => $composableBuilder(
      column: $table.operation, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get explanation => $composableBuilder(
      column: $table.explanation, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));
}

class $$ReminderAuditRowsTableOrderingComposer
    extends Composer<_$AppDatabase, $ReminderAuditRowsTable> {
  $$ReminderAuditRowsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get reminderKey => $composableBuilder(
      column: $table.reminderKey, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get operation => $composableBuilder(
      column: $table.operation, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get explanation => $composableBuilder(
      column: $table.explanation, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));
}

class $$ReminderAuditRowsTableAnnotationComposer
    extends Composer<_$AppDatabase, $ReminderAuditRowsTable> {
  $$ReminderAuditRowsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get reminderKey => $composableBuilder(
      column: $table.reminderKey, builder: (column) => column);

  GeneratedColumn<String> get operation =>
      $composableBuilder(column: $table.operation, builder: (column) => column);

  GeneratedColumn<String> get explanation => $composableBuilder(
      column: $table.explanation, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);
}

class $$ReminderAuditRowsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $ReminderAuditRowsTable,
    ReminderAuditRow,
    $$ReminderAuditRowsTableFilterComposer,
    $$ReminderAuditRowsTableOrderingComposer,
    $$ReminderAuditRowsTableAnnotationComposer,
    $$ReminderAuditRowsTableCreateCompanionBuilder,
    $$ReminderAuditRowsTableUpdateCompanionBuilder,
    (
      ReminderAuditRow,
      BaseReferences<_$AppDatabase, $ReminderAuditRowsTable, ReminderAuditRow>
    ),
    ReminderAuditRow,
    PrefetchHooks Function()> {
  $$ReminderAuditRowsTableTableManager(
      _$AppDatabase db, $ReminderAuditRowsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ReminderAuditRowsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ReminderAuditRowsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ReminderAuditRowsTableAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> reminderKey = const Value.absent(),
            Value<String> operation = const Value.absent(),
            Value<String> explanation = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              ReminderAuditRowsCompanion(
            id: id,
            reminderKey: reminderKey,
            operation: operation,
            explanation: explanation,
            createdAt: createdAt,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String reminderKey,
            required String operation,
            required String explanation,
            required DateTime createdAt,
            Value<int> rowid = const Value.absent(),
          }) =>
              ReminderAuditRowsCompanion.insert(
            id: id,
            reminderKey: reminderKey,
            operation: operation,
            explanation: explanation,
            createdAt: createdAt,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable<$ReminderAuditRowsTable, ReminderAuditRow>(
                        table),
                    BaseReferences<_$AppDatabase, $ReminderAuditRowsTable,
                        ReminderAuditRow>(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$ReminderAuditRowsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $ReminderAuditRowsTable,
    ReminderAuditRow,
    $$ReminderAuditRowsTableFilterComposer,
    $$ReminderAuditRowsTableOrderingComposer,
    $$ReminderAuditRowsTableAnnotationComposer,
    $$ReminderAuditRowsTableCreateCompanionBuilder,
    $$ReminderAuditRowsTableUpdateCompanionBuilder,
    (
      ReminderAuditRow,
      BaseReferences<_$AppDatabase, $ReminderAuditRowsTable, ReminderAuditRow>
    ),
    ReminderAuditRow,
    PrefetchHooks Function()>;
typedef $$RouteProfilesTableCreateCompanionBuilder = RouteProfilesCompanion
    Function({
  required String id,
  required String originCluster,
  required String destinationCluster,
  required String typicalTransport,
  required int typicalDurationMinutes,
  required double variance,
  required int dayOfWeek,
  required String timeWindowLabel,
  required int sampleCount,
  required DateTime lastUpdated,
  Value<int> rowid,
});
typedef $$RouteProfilesTableUpdateCompanionBuilder = RouteProfilesCompanion
    Function({
  Value<String> id,
  Value<String> originCluster,
  Value<String> destinationCluster,
  Value<String> typicalTransport,
  Value<int> typicalDurationMinutes,
  Value<double> variance,
  Value<int> dayOfWeek,
  Value<String> timeWindowLabel,
  Value<int> sampleCount,
  Value<DateTime> lastUpdated,
  Value<int> rowid,
});

final class $$RouteProfilesTableReferences extends BaseReferences<_$AppDatabase,
    $RouteProfilesTable, RouteProfileRow> {
  $$RouteProfilesTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$RouteObservationsTable, List<RouteObservationRow>>
      _routeObservationsRefsTable(_$AppDatabase db) =>
          MultiTypedResultKey.fromTable(db.routeObservations,
              aliasName:
                  'route_profiles__id__route_observations__route_profile_id');

  $$RouteObservationsTableProcessedTableManager get routeObservationsRefs {
    final manager = $$RouteObservationsTableTableManager(
            $_db, $_db.routeObservations)
        .filter(
            (f) => f.routeProfileId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache =
        $_typedResult.readTableOrNull(_routeObservationsRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$RouteProfilesTableFilterComposer
    extends Composer<_$AppDatabase, $RouteProfilesTable> {
  $$RouteProfilesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get originCluster => $composableBuilder(
      column: $table.originCluster, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get destinationCluster => $composableBuilder(
      column: $table.destinationCluster,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get typicalTransport => $composableBuilder(
      column: $table.typicalTransport,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get typicalDurationMinutes => $composableBuilder(
      column: $table.typicalDurationMinutes,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get variance => $composableBuilder(
      column: $table.variance, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get dayOfWeek => $composableBuilder(
      column: $table.dayOfWeek, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get timeWindowLabel => $composableBuilder(
      column: $table.timeWindowLabel,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get sampleCount => $composableBuilder(
      column: $table.sampleCount, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get lastUpdated => $composableBuilder(
      column: $table.lastUpdated, builder: (column) => ColumnFilters(column));

  Expression<bool> routeObservationsRefs(
      Expression<bool> Function($$RouteObservationsTableFilterComposer f) f) {
    final $$RouteObservationsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.routeObservations,
        getReferencedColumn: (t) => t.routeProfileId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$RouteObservationsTableFilterComposer(
              $db: $db,
              $table: $db.routeObservations,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$RouteProfilesTableOrderingComposer
    extends Composer<_$AppDatabase, $RouteProfilesTable> {
  $$RouteProfilesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get originCluster => $composableBuilder(
      column: $table.originCluster,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get destinationCluster => $composableBuilder(
      column: $table.destinationCluster,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get typicalTransport => $composableBuilder(
      column: $table.typicalTransport,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get typicalDurationMinutes => $composableBuilder(
      column: $table.typicalDurationMinutes,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get variance => $composableBuilder(
      column: $table.variance, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get dayOfWeek => $composableBuilder(
      column: $table.dayOfWeek, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get timeWindowLabel => $composableBuilder(
      column: $table.timeWindowLabel,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get sampleCount => $composableBuilder(
      column: $table.sampleCount, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get lastUpdated => $composableBuilder(
      column: $table.lastUpdated, builder: (column) => ColumnOrderings(column));
}

class $$RouteProfilesTableAnnotationComposer
    extends Composer<_$AppDatabase, $RouteProfilesTable> {
  $$RouteProfilesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get originCluster => $composableBuilder(
      column: $table.originCluster, builder: (column) => column);

  GeneratedColumn<String> get destinationCluster => $composableBuilder(
      column: $table.destinationCluster, builder: (column) => column);

  GeneratedColumn<String> get typicalTransport => $composableBuilder(
      column: $table.typicalTransport, builder: (column) => column);

  GeneratedColumn<int> get typicalDurationMinutes => $composableBuilder(
      column: $table.typicalDurationMinutes, builder: (column) => column);

  GeneratedColumn<double> get variance =>
      $composableBuilder(column: $table.variance, builder: (column) => column);

  GeneratedColumn<int> get dayOfWeek =>
      $composableBuilder(column: $table.dayOfWeek, builder: (column) => column);

  GeneratedColumn<String> get timeWindowLabel => $composableBuilder(
      column: $table.timeWindowLabel, builder: (column) => column);

  GeneratedColumn<int> get sampleCount => $composableBuilder(
      column: $table.sampleCount, builder: (column) => column);

  GeneratedColumn<DateTime> get lastUpdated => $composableBuilder(
      column: $table.lastUpdated, builder: (column) => column);

  Expression<T> routeObservationsRefs<T extends Object>(
      Expression<T> Function($$RouteObservationsTableAnnotationComposer a) f) {
    final $$RouteObservationsTableAnnotationComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.id,
            referencedTable: $db.routeObservations,
            getReferencedColumn: (t) => t.routeProfileId,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$RouteObservationsTableAnnotationComposer(
                  $db: $db,
                  $table: $db.routeObservations,
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return f(composer);
  }
}

class $$RouteProfilesTableTableManager extends RootTableManager<
    _$AppDatabase,
    $RouteProfilesTable,
    RouteProfileRow,
    $$RouteProfilesTableFilterComposer,
    $$RouteProfilesTableOrderingComposer,
    $$RouteProfilesTableAnnotationComposer,
    $$RouteProfilesTableCreateCompanionBuilder,
    $$RouteProfilesTableUpdateCompanionBuilder,
    (RouteProfileRow, $$RouteProfilesTableReferences),
    RouteProfileRow,
    PrefetchHooks Function({bool routeObservationsRefs})> {
  $$RouteProfilesTableTableManager(_$AppDatabase db, $RouteProfilesTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$RouteProfilesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$RouteProfilesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$RouteProfilesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> originCluster = const Value.absent(),
            Value<String> destinationCluster = const Value.absent(),
            Value<String> typicalTransport = const Value.absent(),
            Value<int> typicalDurationMinutes = const Value.absent(),
            Value<double> variance = const Value.absent(),
            Value<int> dayOfWeek = const Value.absent(),
            Value<String> timeWindowLabel = const Value.absent(),
            Value<int> sampleCount = const Value.absent(),
            Value<DateTime> lastUpdated = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              RouteProfilesCompanion(
            id: id,
            originCluster: originCluster,
            destinationCluster: destinationCluster,
            typicalTransport: typicalTransport,
            typicalDurationMinutes: typicalDurationMinutes,
            variance: variance,
            dayOfWeek: dayOfWeek,
            timeWindowLabel: timeWindowLabel,
            sampleCount: sampleCount,
            lastUpdated: lastUpdated,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String originCluster,
            required String destinationCluster,
            required String typicalTransport,
            required int typicalDurationMinutes,
            required double variance,
            required int dayOfWeek,
            required String timeWindowLabel,
            required int sampleCount,
            required DateTime lastUpdated,
            Value<int> rowid = const Value.absent(),
          }) =>
              RouteProfilesCompanion.insert(
            id: id,
            originCluster: originCluster,
            destinationCluster: destinationCluster,
            typicalTransport: typicalTransport,
            typicalDurationMinutes: typicalDurationMinutes,
            variance: variance,
            dayOfWeek: dayOfWeek,
            timeWindowLabel: timeWindowLabel,
            sampleCount: sampleCount,
            lastUpdated: lastUpdated,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable<$RouteProfilesTable, RouteProfileRow>(table),
                    $$RouteProfilesTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({routeObservationsRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (routeObservationsRefs) db.routeObservations
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (routeObservationsRefs)
                    await $_getPrefetchedData<RouteProfileRow,
                            $RouteProfilesTable, RouteObservationRow>(
                        currentTable: table,
                        referencedTable: $$RouteProfilesTableReferences
                            ._routeObservationsRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$RouteProfilesTableReferences(db, table, p0)
                                .routeObservationsRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.routeProfileId == item.id),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$RouteProfilesTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $RouteProfilesTable,
    RouteProfileRow,
    $$RouteProfilesTableFilterComposer,
    $$RouteProfilesTableOrderingComposer,
    $$RouteProfilesTableAnnotationComposer,
    $$RouteProfilesTableCreateCompanionBuilder,
    $$RouteProfilesTableUpdateCompanionBuilder,
    (RouteProfileRow, $$RouteProfilesTableReferences),
    RouteProfileRow,
    PrefetchHooks Function({bool routeObservationsRefs})>;
typedef $$RouteObservationsTableCreateCompanionBuilder
    = RouteObservationsCompanion Function({
  required String id,
  required String routeProfileId,
  required int durationMinutes,
  required String transport,
  required DateTime observedAt,
  required String source,
  Value<int> rowid,
});
typedef $$RouteObservationsTableUpdateCompanionBuilder
    = RouteObservationsCompanion Function({
  Value<String> id,
  Value<String> routeProfileId,
  Value<int> durationMinutes,
  Value<String> transport,
  Value<DateTime> observedAt,
  Value<String> source,
  Value<int> rowid,
});

final class $$RouteObservationsTableReferences extends BaseReferences<
    _$AppDatabase, $RouteObservationsTable, RouteObservationRow> {
  $$RouteObservationsTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static $RouteProfilesTable _routeProfileIdTable(_$AppDatabase db) => db
      .routeProfiles
      .createAlias('route_observations__route_profile_id__route_profiles__id');

  $$RouteProfilesTableProcessedTableManager get routeProfileId {
    final $_column = $_itemColumn<String>('route_profile_id')!;

    final manager = $$RouteProfilesTableTableManager($_db, $_db.routeProfiles)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_routeProfileIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$RouteObservationsTableFilterComposer
    extends Composer<_$AppDatabase, $RouteObservationsTable> {
  $$RouteObservationsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get durationMinutes => $composableBuilder(
      column: $table.durationMinutes,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get transport => $composableBuilder(
      column: $table.transport, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get observedAt => $composableBuilder(
      column: $table.observedAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get source => $composableBuilder(
      column: $table.source, builder: (column) => ColumnFilters(column));

  $$RouteProfilesTableFilterComposer get routeProfileId {
    final $$RouteProfilesTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.routeProfileId,
        referencedTable: $db.routeProfiles,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$RouteProfilesTableFilterComposer(
              $db: $db,
              $table: $db.routeProfiles,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$RouteObservationsTableOrderingComposer
    extends Composer<_$AppDatabase, $RouteObservationsTable> {
  $$RouteObservationsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get durationMinutes => $composableBuilder(
      column: $table.durationMinutes,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get transport => $composableBuilder(
      column: $table.transport, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get observedAt => $composableBuilder(
      column: $table.observedAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get source => $composableBuilder(
      column: $table.source, builder: (column) => ColumnOrderings(column));

  $$RouteProfilesTableOrderingComposer get routeProfileId {
    final $$RouteProfilesTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.routeProfileId,
        referencedTable: $db.routeProfiles,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$RouteProfilesTableOrderingComposer(
              $db: $db,
              $table: $db.routeProfiles,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$RouteObservationsTableAnnotationComposer
    extends Composer<_$AppDatabase, $RouteObservationsTable> {
  $$RouteObservationsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get durationMinutes => $composableBuilder(
      column: $table.durationMinutes, builder: (column) => column);

  GeneratedColumn<String> get transport =>
      $composableBuilder(column: $table.transport, builder: (column) => column);

  GeneratedColumn<DateTime> get observedAt => $composableBuilder(
      column: $table.observedAt, builder: (column) => column);

  GeneratedColumn<String> get source =>
      $composableBuilder(column: $table.source, builder: (column) => column);

  $$RouteProfilesTableAnnotationComposer get routeProfileId {
    final $$RouteProfilesTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.routeProfileId,
        referencedTable: $db.routeProfiles,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$RouteProfilesTableAnnotationComposer(
              $db: $db,
              $table: $db.routeProfiles,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$RouteObservationsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $RouteObservationsTable,
    RouteObservationRow,
    $$RouteObservationsTableFilterComposer,
    $$RouteObservationsTableOrderingComposer,
    $$RouteObservationsTableAnnotationComposer,
    $$RouteObservationsTableCreateCompanionBuilder,
    $$RouteObservationsTableUpdateCompanionBuilder,
    (RouteObservationRow, $$RouteObservationsTableReferences),
    RouteObservationRow,
    PrefetchHooks Function({bool routeProfileId})> {
  $$RouteObservationsTableTableManager(
      _$AppDatabase db, $RouteObservationsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$RouteObservationsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$RouteObservationsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$RouteObservationsTableAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> routeProfileId = const Value.absent(),
            Value<int> durationMinutes = const Value.absent(),
            Value<String> transport = const Value.absent(),
            Value<DateTime> observedAt = const Value.absent(),
            Value<String> source = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              RouteObservationsCompanion(
            id: id,
            routeProfileId: routeProfileId,
            durationMinutes: durationMinutes,
            transport: transport,
            observedAt: observedAt,
            source: source,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String routeProfileId,
            required int durationMinutes,
            required String transport,
            required DateTime observedAt,
            required String source,
            Value<int> rowid = const Value.absent(),
          }) =>
              RouteObservationsCompanion.insert(
            id: id,
            routeProfileId: routeProfileId,
            durationMinutes: durationMinutes,
            transport: transport,
            observedAt: observedAt,
            source: source,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable<$RouteObservationsTable, RouteObservationRow>(
                        table),
                    $$RouteObservationsTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({routeProfileId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (routeProfileId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.routeProfileId,
                    referencedTable: $$RouteObservationsTableReferences
                        ._routeProfileIdTable(db),
                    referencedColumn: $$RouteObservationsTableReferences
                        ._routeProfileIdTable(db)
                        .id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ));
}

typedef $$RouteObservationsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $RouteObservationsTable,
    RouteObservationRow,
    $$RouteObservationsTableFilterComposer,
    $$RouteObservationsTableOrderingComposer,
    $$RouteObservationsTableAnnotationComposer,
    $$RouteObservationsTableCreateCompanionBuilder,
    $$RouteObservationsTableUpdateCompanionBuilder,
    (RouteObservationRow, $$RouteObservationsTableReferences),
    RouteObservationRow,
    PrefetchHooks Function({bool routeProfileId})>;
typedef $$WeatherEventsTableCreateCompanionBuilder = WeatherEventsCompanion
    Function({
  required String id,
  required String condition,
  required DateTime startsAt,
  required DateTime endsAt,
  required double probability,
  required int severity,
  required String source,
  required DateTime fetchedAt,
  Value<int> rowid,
});
typedef $$WeatherEventsTableUpdateCompanionBuilder = WeatherEventsCompanion
    Function({
  Value<String> id,
  Value<String> condition,
  Value<DateTime> startsAt,
  Value<DateTime> endsAt,
  Value<double> probability,
  Value<int> severity,
  Value<String> source,
  Value<DateTime> fetchedAt,
  Value<int> rowid,
});

class $$WeatherEventsTableFilterComposer
    extends Composer<_$AppDatabase, $WeatherEventsTable> {
  $$WeatherEventsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get condition => $composableBuilder(
      column: $table.condition, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get startsAt => $composableBuilder(
      column: $table.startsAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get endsAt => $composableBuilder(
      column: $table.endsAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get probability => $composableBuilder(
      column: $table.probability, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get severity => $composableBuilder(
      column: $table.severity, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get source => $composableBuilder(
      column: $table.source, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get fetchedAt => $composableBuilder(
      column: $table.fetchedAt, builder: (column) => ColumnFilters(column));
}

class $$WeatherEventsTableOrderingComposer
    extends Composer<_$AppDatabase, $WeatherEventsTable> {
  $$WeatherEventsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get condition => $composableBuilder(
      column: $table.condition, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get startsAt => $composableBuilder(
      column: $table.startsAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get endsAt => $composableBuilder(
      column: $table.endsAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get probability => $composableBuilder(
      column: $table.probability, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get severity => $composableBuilder(
      column: $table.severity, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get source => $composableBuilder(
      column: $table.source, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get fetchedAt => $composableBuilder(
      column: $table.fetchedAt, builder: (column) => ColumnOrderings(column));
}

class $$WeatherEventsTableAnnotationComposer
    extends Composer<_$AppDatabase, $WeatherEventsTable> {
  $$WeatherEventsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get condition =>
      $composableBuilder(column: $table.condition, builder: (column) => column);

  GeneratedColumn<DateTime> get startsAt =>
      $composableBuilder(column: $table.startsAt, builder: (column) => column);

  GeneratedColumn<DateTime> get endsAt =>
      $composableBuilder(column: $table.endsAt, builder: (column) => column);

  GeneratedColumn<double> get probability => $composableBuilder(
      column: $table.probability, builder: (column) => column);

  GeneratedColumn<int> get severity =>
      $composableBuilder(column: $table.severity, builder: (column) => column);

  GeneratedColumn<String> get source =>
      $composableBuilder(column: $table.source, builder: (column) => column);

  GeneratedColumn<DateTime> get fetchedAt =>
      $composableBuilder(column: $table.fetchedAt, builder: (column) => column);
}

class $$WeatherEventsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $WeatherEventsTable,
    WeatherEventRow,
    $$WeatherEventsTableFilterComposer,
    $$WeatherEventsTableOrderingComposer,
    $$WeatherEventsTableAnnotationComposer,
    $$WeatherEventsTableCreateCompanionBuilder,
    $$WeatherEventsTableUpdateCompanionBuilder,
    (
      WeatherEventRow,
      BaseReferences<_$AppDatabase, $WeatherEventsTable, WeatherEventRow>
    ),
    WeatherEventRow,
    PrefetchHooks Function()> {
  $$WeatherEventsTableTableManager(_$AppDatabase db, $WeatherEventsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$WeatherEventsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$WeatherEventsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$WeatherEventsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> condition = const Value.absent(),
            Value<DateTime> startsAt = const Value.absent(),
            Value<DateTime> endsAt = const Value.absent(),
            Value<double> probability = const Value.absent(),
            Value<int> severity = const Value.absent(),
            Value<String> source = const Value.absent(),
            Value<DateTime> fetchedAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              WeatherEventsCompanion(
            id: id,
            condition: condition,
            startsAt: startsAt,
            endsAt: endsAt,
            probability: probability,
            severity: severity,
            source: source,
            fetchedAt: fetchedAt,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String condition,
            required DateTime startsAt,
            required DateTime endsAt,
            required double probability,
            required int severity,
            required String source,
            required DateTime fetchedAt,
            Value<int> rowid = const Value.absent(),
          }) =>
              WeatherEventsCompanion.insert(
            id: id,
            condition: condition,
            startsAt: startsAt,
            endsAt: endsAt,
            probability: probability,
            severity: severity,
            source: source,
            fetchedAt: fetchedAt,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable<$WeatherEventsTable, WeatherEventRow>(table),
                    BaseReferences<_$AppDatabase, $WeatherEventsTable,
                        WeatherEventRow>(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$WeatherEventsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $WeatherEventsTable,
    WeatherEventRow,
    $$WeatherEventsTableFilterComposer,
    $$WeatherEventsTableOrderingComposer,
    $$WeatherEventsTableAnnotationComposer,
    $$WeatherEventsTableCreateCompanionBuilder,
    $$WeatherEventsTableUpdateCompanionBuilder,
    (
      WeatherEventRow,
      BaseReferences<_$AppDatabase, $WeatherEventsTable, WeatherEventRow>
    ),
    WeatherEventRow,
    PrefetchHooks Function()>;
typedef $$PlannerTasksTableCreateCompanionBuilder = PlannerTasksCompanion
    Function({
  required String id,
  required String title,
  required int durationMinutes,
  required DateTime deadline,
  required String priority,
  required String status,
  required DateTime createdAt,
  required DateTime updatedAt,
  Value<DateTime?> earliestStart,
  Value<String?> notes,
  Value<int> rowid,
});
typedef $$PlannerTasksTableUpdateCompanionBuilder = PlannerTasksCompanion
    Function({
  Value<String> id,
  Value<String> title,
  Value<int> durationMinutes,
  Value<DateTime> deadline,
  Value<String> priority,
  Value<String> status,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
  Value<DateTime?> earliestStart,
  Value<String?> notes,
  Value<int> rowid,
});

class $$PlannerTasksTableFilterComposer
    extends Composer<_$AppDatabase, $PlannerTasksTable> {
  $$PlannerTasksTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get durationMinutes => $composableBuilder(
      column: $table.durationMinutes,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get deadline => $composableBuilder(
      column: $table.deadline, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get priority => $composableBuilder(
      column: $table.priority, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get status => $composableBuilder(
      column: $table.status, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get earliestStart => $composableBuilder(
      column: $table.earliestStart, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get notes => $composableBuilder(
      column: $table.notes, builder: (column) => ColumnFilters(column));
}

class $$PlannerTasksTableOrderingComposer
    extends Composer<_$AppDatabase, $PlannerTasksTable> {
  $$PlannerTasksTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get durationMinutes => $composableBuilder(
      column: $table.durationMinutes,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get deadline => $composableBuilder(
      column: $table.deadline, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get priority => $composableBuilder(
      column: $table.priority, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get status => $composableBuilder(
      column: $table.status, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get earliestStart => $composableBuilder(
      column: $table.earliestStart,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get notes => $composableBuilder(
      column: $table.notes, builder: (column) => ColumnOrderings(column));
}

class $$PlannerTasksTableAnnotationComposer
    extends Composer<_$AppDatabase, $PlannerTasksTable> {
  $$PlannerTasksTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<int> get durationMinutes => $composableBuilder(
      column: $table.durationMinutes, builder: (column) => column);

  GeneratedColumn<DateTime> get deadline =>
      $composableBuilder(column: $table.deadline, builder: (column) => column);

  GeneratedColumn<String> get priority =>
      $composableBuilder(column: $table.priority, builder: (column) => column);

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<DateTime> get earliestStart => $composableBuilder(
      column: $table.earliestStart, builder: (column) => column);

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);
}

class $$PlannerTasksTableTableManager extends RootTableManager<
    _$AppDatabase,
    $PlannerTasksTable,
    PlannerTaskRow,
    $$PlannerTasksTableFilterComposer,
    $$PlannerTasksTableOrderingComposer,
    $$PlannerTasksTableAnnotationComposer,
    $$PlannerTasksTableCreateCompanionBuilder,
    $$PlannerTasksTableUpdateCompanionBuilder,
    (
      PlannerTaskRow,
      BaseReferences<_$AppDatabase, $PlannerTasksTable, PlannerTaskRow>
    ),
    PlannerTaskRow,
    PrefetchHooks Function()> {
  $$PlannerTasksTableTableManager(_$AppDatabase db, $PlannerTasksTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PlannerTasksTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$PlannerTasksTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$PlannerTasksTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> title = const Value.absent(),
            Value<int> durationMinutes = const Value.absent(),
            Value<DateTime> deadline = const Value.absent(),
            Value<String> priority = const Value.absent(),
            Value<String> status = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
            Value<DateTime?> earliestStart = const Value.absent(),
            Value<String?> notes = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              PlannerTasksCompanion(
            id: id,
            title: title,
            durationMinutes: durationMinutes,
            deadline: deadline,
            priority: priority,
            status: status,
            createdAt: createdAt,
            updatedAt: updatedAt,
            earliestStart: earliestStart,
            notes: notes,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String title,
            required int durationMinutes,
            required DateTime deadline,
            required String priority,
            required String status,
            required DateTime createdAt,
            required DateTime updatedAt,
            Value<DateTime?> earliestStart = const Value.absent(),
            Value<String?> notes = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              PlannerTasksCompanion.insert(
            id: id,
            title: title,
            durationMinutes: durationMinutes,
            deadline: deadline,
            priority: priority,
            status: status,
            createdAt: createdAt,
            updatedAt: updatedAt,
            earliestStart: earliestStart,
            notes: notes,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable<$PlannerTasksTable, PlannerTaskRow>(table),
                    BaseReferences<_$AppDatabase, $PlannerTasksTable,
                        PlannerTaskRow>(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$PlannerTasksTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $PlannerTasksTable,
    PlannerTaskRow,
    $$PlannerTasksTableFilterComposer,
    $$PlannerTasksTableOrderingComposer,
    $$PlannerTasksTableAnnotationComposer,
    $$PlannerTasksTableCreateCompanionBuilder,
    $$PlannerTasksTableUpdateCompanionBuilder,
    (
      PlannerTaskRow,
      BaseReferences<_$AppDatabase, $PlannerTasksTable, PlannerTaskRow>
    ),
    PlannerTaskRow,
    PrefetchHooks Function()>;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$UserProfilesTableTableManager get userProfiles =>
      $$UserProfilesTableTableManager(_db, _db.userProfiles);
  $$MemoriesTableTableManager get memories =>
      $$MemoriesTableTableManager(_db, _db.memories);
  $$CalendarEventsTableTableManager get calendarEvents =>
      $$CalendarEventsTableTableManager(_db, _db.calendarEvents);
  $$PlansTableTableManager get plans =>
      $$PlansTableTableManager(_db, _db.plans);
  $$PlanBlocksTableTableManager get planBlocks =>
      $$PlanBlocksTableTableManager(_db, _db.planBlocks);
  $$AlarmsTableTableManager get alarms =>
      $$AlarmsTableTableManager(_db, _db.alarms);
  $$NotificationRowsTableTableManager get notificationRows =>
      $$NotificationRowsTableTableManager(_db, _db.notificationRows);
  $$ReminderRowsTableTableManager get reminderRows =>
      $$ReminderRowsTableTableManager(_db, _db.reminderRows);
  $$ReminderAuditRowsTableTableManager get reminderAuditRows =>
      $$ReminderAuditRowsTableTableManager(_db, _db.reminderAuditRows);
  $$RouteProfilesTableTableManager get routeProfiles =>
      $$RouteProfilesTableTableManager(_db, _db.routeProfiles);
  $$RouteObservationsTableTableManager get routeObservations =>
      $$RouteObservationsTableTableManager(_db, _db.routeObservations);
  $$WeatherEventsTableTableManager get weatherEvents =>
      $$WeatherEventsTableTableManager(_db, _db.weatherEvents);
  $$PlannerTasksTableTableManager get plannerTasks =>
      $$PlannerTasksTableTableManager(_db, _db.plannerTasks);
}
