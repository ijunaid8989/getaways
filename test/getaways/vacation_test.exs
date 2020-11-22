defmodule Getaways.VacationTest do
  use Getaways.DataCase

  alias Getaways.Vacation

  describe "places" do
    alias Getaways.Vacation.Place

    @valid_attrs %{description: "some description", image: "some image", image_thumbnail: "some image_thumbnail", location: "some location", max_guests: 42, name: "some name", pet_friendly: true, pool: true, price_per_night: "120.5", slug: "some slug", wifi: true}
    @update_attrs %{description: "some updated description", image: "some updated image", image_thumbnail: "some updated image_thumbnail", location: "some updated location", max_guests: 43, name: "some updated name", pet_friendly: false, pool: false, price_per_night: "456.7", slug: "some updated slug", wifi: false}
    @invalid_attrs %{description: nil, image: nil, image_thumbnail: nil, location: nil, max_guests: nil, name: nil, pet_friendly: nil, pool: nil, price_per_night: nil, slug: nil, wifi: nil}

    def place_fixture(attrs \\ %{}) do
      {:ok, place} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Vacation.create_place()

      place
    end

    test "list_places/0 returns all places" do
      place = place_fixture()
      assert Vacation.list_places() == [place]
    end

    test "get_place!/1 returns the place with given id" do
      place = place_fixture()
      assert Vacation.get_place!(place.id) == place
    end

    test "create_place/1 with valid data creates a place" do
      assert {:ok, %Place{} = place} = Vacation.create_place(@valid_attrs)
      assert place.description == "some description"
      assert place.image == "some image"
      assert place.image_thumbnail == "some image_thumbnail"
      assert place.location == "some location"
      assert place.max_guests == 42
      assert place.name == "some name"
      assert place.pet_friendly == true
      assert place.pool == true
      assert place.price_per_night == Decimal.new("120.5")
      assert place.slug == "some slug"
      assert place.wifi == true
    end

    test "create_place/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Vacation.create_place(@invalid_attrs)
    end

    test "update_place/2 with valid data updates the place" do
      place = place_fixture()
      assert {:ok, %Place{} = place} = Vacation.update_place(place, @update_attrs)
      assert place.description == "some updated description"
      assert place.image == "some updated image"
      assert place.image_thumbnail == "some updated image_thumbnail"
      assert place.location == "some updated location"
      assert place.max_guests == 43
      assert place.name == "some updated name"
      assert place.pet_friendly == false
      assert place.pool == false
      assert place.price_per_night == Decimal.new("456.7")
      assert place.slug == "some updated slug"
      assert place.wifi == false
    end

    test "update_place/2 with invalid data returns error changeset" do
      place = place_fixture()
      assert {:error, %Ecto.Changeset{}} = Vacation.update_place(place, @invalid_attrs)
      assert place == Vacation.get_place!(place.id)
    end

    test "delete_place/1 deletes the place" do
      place = place_fixture()
      assert {:ok, %Place{}} = Vacation.delete_place(place)
      assert_raise Ecto.NoResultsError, fn -> Vacation.get_place!(place.id) end
    end

    test "change_place/1 returns a place changeset" do
      place = place_fixture()
      assert %Ecto.Changeset{} = Vacation.change_place(place)
    end
  end

  describe "bookings" do
    alias Getaways.Vacation.Booking

    @valid_attrs %{end_date: ~D[2010-04-17], start_date: ~D[2010-04-17], state: "some state", total_price: "120.5"}
    @update_attrs %{end_date: ~D[2011-05-18], start_date: ~D[2011-05-18], state: "some updated state", total_price: "456.7"}
    @invalid_attrs %{end_date: nil, start_date: nil, state: nil, total_price: nil}

    def booking_fixture(attrs \\ %{}) do
      {:ok, booking} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Vacation.create_booking()

      booking
    end

    test "list_bookings/0 returns all bookings" do
      booking = booking_fixture()
      assert Vacation.list_bookings() == [booking]
    end

    test "get_booking!/1 returns the booking with given id" do
      booking = booking_fixture()
      assert Vacation.get_booking!(booking.id) == booking
    end

    test "create_booking/1 with valid data creates a booking" do
      assert {:ok, %Booking{} = booking} = Vacation.create_booking(@valid_attrs)
      assert booking.end_date == ~D[2010-04-17]
      assert booking.start_date == ~D[2010-04-17]
      assert booking.state == "some state"
      assert booking.total_price == Decimal.new("120.5")
    end

    test "create_booking/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Vacation.create_booking(@invalid_attrs)
    end

    test "update_booking/2 with valid data updates the booking" do
      booking = booking_fixture()
      assert {:ok, %Booking{} = booking} = Vacation.update_booking(booking, @update_attrs)
      assert booking.end_date == ~D[2011-05-18]
      assert booking.start_date == ~D[2011-05-18]
      assert booking.state == "some updated state"
      assert booking.total_price == Decimal.new("456.7")
    end

    test "update_booking/2 with invalid data returns error changeset" do
      booking = booking_fixture()
      assert {:error, %Ecto.Changeset{}} = Vacation.update_booking(booking, @invalid_attrs)
      assert booking == Vacation.get_booking!(booking.id)
    end

    test "delete_booking/1 deletes the booking" do
      booking = booking_fixture()
      assert {:ok, %Booking{}} = Vacation.delete_booking(booking)
      assert_raise Ecto.NoResultsError, fn -> Vacation.get_booking!(booking.id) end
    end

    test "change_booking/1 returns a booking changeset" do
      booking = booking_fixture()
      assert %Ecto.Changeset{} = Vacation.change_booking(booking)
    end
  end
end
