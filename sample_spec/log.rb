require_relative 'helper.rb'

describe "when user Access java ranch", :type => :request do
  context "when user click on Cattle Drive link" do
    include_context "login"
    before :all do

      find(:link, "CATTLE DRIVE").click
      # find(:xpath, ".//*[contains(@class, 'close')]").click
      # find(:xpath, ".//*[@id='item-list-container-120']/div[1]/div[1][@href='/makda/shopping/itemdetails?itemCode=152UB&amp;countryCode=US']").click
      # sleep 10.0
    end

    it "validate text after Cattle Drive link clicked" do     
      page.should have_content("Java College")  
      # page.should have_content("Product Description")                       
    end

    it "validate text after java Book link clicked" do   
      find(:link, "Best Topics").click  
      page.should have_content("programming forums")                         
    end
  end
end


#Refrance: 
#.  find(:xpath, ".//*[@data-ffxtype='fforceSaveButton']/div[1]").click
#   $planner_header = ".//*[@data-ffxtype='fforceSaveButton']//a[contains(@class, 'f-unselectable f-box-item')]"
#.  find(:xpath, $planner_header+"/div[1]/a[2]").click
#.   find("#PlannerScheduler_collapse_button").click 
#.   fill_in "PlannerDateRange_from-inputEl", :with => (Date.today - 60) 
#    find_button('send').click
#.   find('#login').set("some value")
#.   fill_in 'Name', with: 'jimmy'
#.   click_link('')

#find(:xpath, record_cell(3, 1)).should have_content("somevalue")
#expect(page).to have_xpath('a')