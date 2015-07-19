events = [
  %{
    details: "Looks like new, in good condition, used for 1.5 years",
    message: "Apple",
    event_type: "error"
  },
  %{
    details: "This is thinner and lighter than its predecessor. Used for 2 years",
    message: "Toshiba",
    event_type: "error"
  },
  %{
    details: "The design and construction of the laptop still looks good. Used for 1 year",
    message: "HP",
    event_type: "error"
  }
]

for event <- events do
  new_event = Map.merge(%Stroz.Event{}, event)
  Stroz.Repo.insert!(new_event)
end
