import React, { useEffect, useState } from "react";
import axios from 'utils/axios';
import grapesjs from 'grapesjs'
import gjsPresetWebage from 'grapesjs-preset-webpage'
import {
  Row,
  Col,
  Button,
  Nav,
  NavItem,
  NavLink
} from 'reactstrap'

type Props = any

const PostsEdit: React.FC<Props> = (props) => {
  // const [post, setPost] = useState({contentHtml: '', contentCss: ''})
  const [editor, setEditor] = useState(null);

  const onSubmitHandler = () => {
    console.log(editor.getCss(), editor.getHtml())
    const postData = {post: {
      content_html: editor.getHtml(),
      content_css: editor.getCss(),
    }}

    axios.patch(`/admin/api/posts/${props.postId}`,
      postData,
      {'Content-Type': 'multipart/form-data'}
    )
    .then(() => {
      // refresh()
    })
    .catch(error => {
      // setLoading(false)
    });
  }

  const refresh = () => {
    const postData = []
    axios.get(`/admin/api/posts/${props.postId}`)
      .then(response => {
        const contentHtml = response.data.post.content_html
        const contentCss = response.data.post.content_css
        const editor = grapesjs.init({
          container: '#editor',
          components: contentHtml,
          style: contentCss,
          height: 'calc(100vh - 40px)',
          plugins: [gjsPresetWebage],
          pluginsOpts: {
            gjsPresetWebage: {}
          }
        });
        setEditor(editor)
      })
  };

  useEffect(() => {
    refresh()
  }, []);

  return (
    <>
      <Row className="w-100 m-0">
        <Col xs={1} className='p-0 nav-sideber'>
          <Nav
            vertical
          >
            <NavItem>
              <Button onClick={onSubmitHandler}>保存</Button>
            </NavItem>
          </Nav>
        </Col>
        <Col className='p-0'>
          <div id='editor'></div>
        </Col>
      </Row>
    </>
  )
}

export default PostsEdit
