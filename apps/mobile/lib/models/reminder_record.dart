enum ReminderKind { taskStart, taskDeadline, appointment }

enum ReminderStatus { scheduled, waitingPermission, cancelled, obsolete }

/// Persisted desired Android reminder state. `scheduled` means handed to the
/// platform scheduler; it does not mean Android delivered the notification.
class ReminderRecord {
  const ReminderRecord({
    required this.key,
    required this.notificationId,
    required this.ownerId,
    required this.kind,
    required this.scheduledFor,
    required this.title,
    required this.body,
    required this.evidence,
    required this.evidenceIds,
    required this.status,
    required this.updatedAt,
  });

  final String key;
  final int notificationId;
  final String ownerId;
  final ReminderKind kind;
  final DateTime scheduledFor;
  final String title;
  final String body;
  final String evidence;
  final List<String> evidenceIds;
  final ReminderStatus status;
  final DateTime updatedAt;

  ReminderRecord copyWith({
    int? notificationId,
    DateTime? scheduledFor,
    String? title,
    String? body,
    String? evidence,
    List<String>? evidenceIds,
    ReminderStatus? status,
    DateTime? updatedAt,
  }) =>
      ReminderRecord(
        key: key,
        notificationId: notificationId ?? this.notificationId,
        ownerId: ownerId,
        kind: kind,
        scheduledFor: scheduledFor ?? this.scheduledFor,
        title: title ?? this.title,
        body: body ?? this.body,
        evidence: evidence ?? this.evidence,
        evidenceIds: evidenceIds ?? this.evidenceIds,
        status: status ?? this.status,
        updatedAt: updatedAt ?? this.updatedAt,
      );
}

class ReminderAudit {
  const ReminderAudit({
    required this.id,
    required this.reminderKey,
    required this.operation,
    required this.explanation,
    required this.createdAt,
  });

  final String id;
  final String reminderKey;
  final String operation;
  final String explanation;
  final DateTime createdAt;
}
