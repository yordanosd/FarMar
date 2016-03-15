require_relative './spec_helper'

describe FarMar::Vendor do
  let(:vendor_11) { FarMar::Vendor.new(id: 11, name: "Donnelly-Quigley", total_employees: 7, market_id: 3 )}
  # let(:vendor_12) { FarMar::Vendor.find(12) } # create an instance of vendor that I can use

  it "should be an object we have access to" do
    FarMar::Vendor.wont_be_nil
  end

  describe "FarMar::Vendor#all" do
    it "returns an array of instances of vendors" do
      FarMar::Vendor.all.class.must_equal Array
    end

    it "returns an instance of FarMar::Vendor" do
      classes = FarMar::Vendor.all.map { |vendor| vendor.class }
      classes.uniq.must_equal [FarMar::Vendor] # in array because the result is mapped into array and the uniq feature reduces the result in the array
    end
  end

  describe "FarMar::Vendor#find(id)" do
    it "returns an instance of FarMar::Vendor given vendor_id(11)" do
      vendor_11.must_be_instance_of FarMar::Vendor #.must_be_instance_of FarMar::Vendor
    end

    it "returns information about vendor(11)" do
      vendor_11.id.must_equal 11 #.must_be_instance_of FarMar::Vendor
      vendor_11.name.must_equal "Donnelly-Quigley"
      vendor_11.total_employees.must_equal 7
      vendor_11.market_id.must_equal 3
    end
  end

  # market method -  returns the FarMar::Market instance that is associated with this
  # vendor using market_id field. The markets the vendor uses.
  describe "FarMar::Vendor#market" do
    it "returns a collection of market instances for vendor(11)" do
      markets = vendor_11.market.map { |market| market.class}
      markets.uniq.must_equal [FarMar::Market]
    end
  end

  # products method - return the FarMar::Product instances that is associated with a particular
  # vendor matching vendor.id and product.vendor_id

  describe "FarMar::Vendor#products" do
    it "returns a collection of instances of FarMar::Product assocaited with vendor(11)" do
      products = vendor_11.products.map { |product| product.class}
      products.uniq.must_equal [FarMar::Product]
    end
  end

  # sales method: returns a collection of FarMar::Sale instances that are associated
  # with a specific vendor. Returns all the sales for each vendor.
  describe "FarMar::Vendor#sales" do
    it "return a collection of FarMar::Sale instances for vendor_11 instance" do
      sales = vendor_11.sales.map { |sale| sale.class }
      sales.uniq.must_equal [FarMar::Sale]
    end
  end

  #revenue: returns the the sum of all of the vendor's sales (in cents)
  describe "FarMar::Vendor#revenue" do
    it "returns the sum of all vendor(11) sales (in cents)"
      vendor_11.revenue.must_be_instance_of Fixnum
  end
end
