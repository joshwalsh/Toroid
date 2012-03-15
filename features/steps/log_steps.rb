steps_for :log do
  step "the time log should include :activity" do |activity|
    page.should have_content(activity)
  end
end
