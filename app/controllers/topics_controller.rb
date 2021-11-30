class TopicsController < ApplicationController
  # Model name - Topic
  def index
    # @topics = Topic.all 
    @topics = @sub.topics
    render component: 'Topics', props: { topics: @topics }
  end

  def show
    # @topic = Topic.find(params[:id])
    @topic = @sub.topics.fine(params[:id])
    render component: 'Topic', props: { topic: @topic }
  end

  def new
    # @topic = Topic.new
    @topic = @sub.topic.new
    render component: 'TopicNew', props: { topic: @topic}
  end

  def create
    # @topic = Topic.new(topic_params)
    @topic = @sub.topic.new(topic_params)
    if @topic.save
      redirect_to subs_path
    else
      render component: 'TopicNew', props {
        topic: @topic
      }
    end

  def edit
    # @topic = Topic.find(params:[:id])
    @topic = @sub.topic.find(params:[:id])
    render component: 'TopicEdit', props { topic: @topic }
  end

  def update
    # @topic = Topic.find(params[:id])
    @topic = @sub.topic.find(params[:id])
    if @topic.update(topic_params)
      redirect_to subs_path
    else
      render component: 'TopicEdit', props { topic: @topic }
    end
  end

  def destroy
    # @topic = Topic.find(params[:id])
    @topic = @sub.topic.find(params[:id])
    @topic.destroy
    redirect_to subs_path
  end

  private

    def topic_params
      params.require(:topic).permit(:title, :body)
    end

end
