defmodule Ink.Schema.Types.Note do
  use Absinthe.Schema.Notation

  import Ink.Request, only: [with_login: 1]

  alias Ink.Resolver
  
  object :post_queries do
    field :public_post, type: :post do
      arg :uid, non_null(:string)
      arg :secret, non_null(:string)
      resolve &Resolver.Note.find_by_secret/2
    end

    field :posts, list_of(:post) do
      resolve with_login(&Resolver.Note.all/2)
    end

    field :post, type: :post do
      arg :uid, non_null(:string)
      resolve with_login(&Resolver.Note.find/2)
    end
  end

  input_object :update_post_params do
    field :title, non_null(:string)
    field :body, non_null(:string)
    field :user_id, non_null(:integer)
  end

  object :post_mutations do
    field :create_post, type: :post do
      arg :title, non_null(:string)
      arg :body, non_null(:string)
      arg :user_id, non_null(:integer)

      resolve with_login(&Resolver.Note.create/2)
    end

    field :update_post, type: :post do
      arg :uid, non_null(:string)
      arg :post, :update_post_params

      resolve with_login(&Resolver.Note.update/2)
    end

    field :delete_post, type: :post do
      arg :uid, non_null(:string)

      resolve with_login(&Resolver.Note.delete/2)
    end

    field :create_post_label, type: :post do
      arg :uid, non_null(:string)
      arg :label_id, non_null(:integer)

      resolve with_login(&Resolver.Note.add_label/2)
    end

    field :delete_post_label, type: :post do
      arg :uid, non_null(:string)
      arg :label_id, non_null(:integer)

      resolve with_login(&Resolver.Note.remove_label/2)
    end
  end
end
