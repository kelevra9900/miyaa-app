class SettingsNotificationState {
  final bool promotions;
  final bool ongoingTreatments;
  final bool dailyDoses;
  final bool upcomingAppointments;
  final bool cancelledAppointments;
  final bool rescheduledAppointments;
  final bool liveChat;
  final bool messages;
  final bool resetValues;
  final bool? isLoading;
  final bool? viewButtons;

  SettingsNotificationState({
    this.promotions = true,
    this.ongoingTreatments = true,
    this.dailyDoses = true,
    this.upcomingAppointments = true,
    this.cancelledAppointments = true,
    this.rescheduledAppointments = true,
    this.liveChat = true,
    this.messages = true,
    this.resetValues = false,
    this.isLoading = false,
    this.viewButtons = false,
  });

  SettingsNotificationState copyWith({
    bool? promotions,
    bool? ongoingTreatments,
    bool? dailyDoses,
    bool? upcomingAppointments,
    bool? cancelledAppointments,
    bool? rescheduledAppointments,
    bool? liveChat,
    bool? messages,
    bool? resetValues,
    bool? isLoading,
    bool? viewButtons,
  }) {
    return SettingsNotificationState(
      promotions: promotions ?? this.promotions,
      ongoingTreatments: ongoingTreatments ?? this.ongoingTreatments,
      dailyDoses: dailyDoses ?? this.dailyDoses,
      upcomingAppointments: upcomingAppointments ?? this.upcomingAppointments,
      cancelledAppointments:
          cancelledAppointments ?? this.cancelledAppointments,
      rescheduledAppointments:
          rescheduledAppointments ?? this.rescheduledAppointments,
      liveChat: liveChat ?? this.liveChat,
      messages: messages ?? this.messages,
      resetValues: resetValues ?? this.resetValues,
      isLoading: isLoading ?? this.isLoading,
      viewButtons: viewButtons ?? this.viewButtons,
    );
  }
}
