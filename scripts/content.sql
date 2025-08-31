--
-- PostgreSQL database dump
--

-- Dumped from database version 16.3
-- Dumped by pg_dump version 16.3

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: content; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE content (
    content_id character varying(20) NOT NULL,
    content_type_id character varying(20),
    owner_content_id character varying(20),
    decorator_content_id character varying(20),
    instance_of_content_id character varying(20),
    data_resource_id character varying(20),
    template_data_resource_id character varying(20),
    data_source_id character varying(20),
    status_id character varying(20),
    privilege_enum_id character varying(20),
    service_name character varying(255),
    custom_method_id character varying(20),
    content_name character varying(255),
    description character varying(255),
    locale_string character varying(10),
    mime_type_id character varying(255),
    character_set_id character varying(60),
    child_leaf_count numeric(20,0),
    child_branch_count numeric(20,0),
    created_date timestamp with time zone,
    created_by_user_login character varying(255),
    last_modified_date timestamp with time zone,
    last_modified_by_user_login character varying(255),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.content OWNER TO ofbiz;

--
-- Name: content pk_content; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY content
    ADD CONSTRAINT pk_content PRIMARY KEY (content_id);


--
-- Name: content_cb_ulgn; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX content_cb_ulgn ON content USING btree (created_by_user_login);


--
-- Name: content_chst; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX content_chst ON content USING btree (character_set_id);


--
-- Name: content_custmet; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX content_custmet ON content USING btree (custom_method_id);


--
-- Name: content_dcntnt; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX content_dcntnt ON content USING btree (decorator_content_id);


--
-- Name: content_dtsrc; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX content_dtsrc ON content USING btree (data_source_id);


--
-- Name: content_iofcnt; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX content_iofcnt ON content USING btree (instance_of_content_id);


--
-- Name: content_lmb_ulgn; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX content_lmb_ulgn ON content USING btree (last_modified_by_user_login);


--
-- Name: content_pcntnt; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX content_pcntnt ON content USING btree (owner_content_id);


--
-- Name: content_privenm; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX content_privenm ON content USING btree (privilege_enum_id);


--
-- Name: content_status; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX content_status ON content USING btree (status_id);


--
-- Name: content_to_data; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX content_to_data ON content USING btree (data_resource_id);


--
-- Name: content_to_tmpdata; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX content_to_tmpdata ON content USING btree (template_data_resource_id);


--
-- Name: content_to_type; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX content_to_type ON content USING btree (content_type_id);


--
-- Name: content_txcrts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX content_txcrts ON content USING btree (created_tx_stamp);


--
-- Name: content_txstmp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX content_txstmp ON content USING btree (last_updated_tx_stamp);


--
-- Name: content content_cb_ulgn; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY content
    ADD CONSTRAINT content_cb_ulgn FOREIGN KEY (created_by_user_login) REFERENCES user_login(user_login_id);


--
-- Name: content content_chst; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY content
    ADD CONSTRAINT content_chst FOREIGN KEY (character_set_id) REFERENCES character_set(character_set_id);


--
-- Name: content content_custmet; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY content
    ADD CONSTRAINT content_custmet FOREIGN KEY (custom_method_id) REFERENCES custom_method(custom_method_id);


--
-- Name: content content_dcntnt; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY content
    ADD CONSTRAINT content_dcntnt FOREIGN KEY (decorator_content_id) REFERENCES content(content_id);


--
-- Name: content content_dtsrc; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY content
    ADD CONSTRAINT content_dtsrc FOREIGN KEY (data_source_id) REFERENCES data_source(data_source_id);


--
-- Name: content content_iofcnt; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY content
    ADD CONSTRAINT content_iofcnt FOREIGN KEY (instance_of_content_id) REFERENCES content(content_id);


--
-- Name: content content_lmb_ulgn; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY content
    ADD CONSTRAINT content_lmb_ulgn FOREIGN KEY (last_modified_by_user_login) REFERENCES user_login(user_login_id);


--
-- Name: content content_pcntnt; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY content
    ADD CONSTRAINT content_pcntnt FOREIGN KEY (owner_content_id) REFERENCES content(content_id);


--
-- Name: content content_privenm; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY content
    ADD CONSTRAINT content_privenm FOREIGN KEY (privilege_enum_id) REFERENCES enumeration(enum_id);


--
-- Name: content content_status; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY content
    ADD CONSTRAINT content_status FOREIGN KEY (status_id) REFERENCES status_item(status_id);


--
-- Name: content content_to_data; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY content
    ADD CONSTRAINT content_to_data FOREIGN KEY (data_resource_id) REFERENCES data_resource(data_resource_id);


--
-- Name: content content_to_tmpdata; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY content
    ADD CONSTRAINT content_to_tmpdata FOREIGN KEY (template_data_resource_id) REFERENCES data_resource(data_resource_id);


--
-- Name: content content_to_type; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY content
    ADD CONSTRAINT content_to_type FOREIGN KEY (content_type_id) REFERENCES content_type(content_type_id);


--
-- PostgreSQL database dump complete
--

