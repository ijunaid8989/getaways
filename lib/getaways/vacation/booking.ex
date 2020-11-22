defmodule Getaways.Vacation.Booking do
  use Ecto.Schema
  import Ecto.Changeset

  schema "bookings" do
    field :end_date, :date
    field :start_date, :date
    field :state, :string, default: "reserved"
    field :total_price, :decimal

    timestamps()
  end

  @doc false
  def changeset(booking, attrs) do
    required_fields = [:start_date, :end_date, :place_id]
    optional_fields = [:state]

    booking
    |> cast(attrs, required_fields ++ optional_fields)
    |> validate_required(required_fields)
  end
end
