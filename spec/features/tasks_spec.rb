require 'rails_helper'

RSpec.describe 'Task Management', type: :feature do
  before do
    Task.create!(title: 'Task 1', thumb_image: 'task1.png', position: 1)
    Task.create!(title: 'Task 2', thumb_image: 'task2.png', position: 2)
    Task.create!(title: 'Task 3', thumb_image: 'task3.png', position: 3)
  end

  it 'displays tasks in order' do
    visit root_path
    expect(page).to have_content('Task 1')
    expect(page).to have_content('Task 2')
    expect(page).to have_content('Task 3')
  end

  it 'allows dragging and reordering tasks', js: true do
    visit root_path
    expect(page).to have_css('#task-list')
    task1 = find('#task-list .task-item:nth-child(1)')
    task2 = find('#task-list .task-item:nth-child(2)')
    task2.drag_to(task1)
    expect(page).to have_css('#task-list .task-item:nth-child(1)', text: 'Task 2')
  end
end
