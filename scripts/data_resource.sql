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
-- Name: data_resource; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE data_resource (
    data_resource_id character varying(20) NOT NULL,
    data_resource_type_id character varying(20),
    data_template_type_id character varying(20),
    data_category_id character varying(20),
    data_source_id character varying(20),
    status_id character varying(20),
    data_resource_name character varying(255),
    locale_string character varying(10),
    mime_type_id character varying(255),
    character_set_id character varying(60),
    object_info character varying(255),
    survey_id character varying(20),
    survey_response_id character varying(20),
    related_detail_id character varying(20),
    is_public character(1),
    created_date timestamp with time zone,
    created_by_user_login character varying(255),
    last_modified_date timestamp with time zone,
    last_modified_by_user_login character varying(255),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.data_resource OWNER TO ofbiz;

--
-- Name: data_resource pk_data_resource; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY data_resource
    ADD CONSTRAINT pk_data_resource PRIMARY KEY (data_resource_id);


--
-- Name: data_rec_cb_ulgn; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX data_rec_cb_ulgn ON data_resource USING btree (created_by_user_login);


--
-- Name: data_rec_chst; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX data_rec_chst ON data_resource USING btree (character_set_id);


--
-- Name: data_rec_dtsrc; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX data_rec_dtsrc ON data_resource USING btree (data_source_id);


--
-- Name: data_rec_lmb_ulgn; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX data_rec_lmb_ulgn ON data_resource USING btree (last_modified_by_user_login);


--
-- Name: data_rec_survey; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX data_rec_survey ON data_resource USING btree (survey_id);


--
-- Name: data_rec_svrsp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX data_rec_svrsp ON data_resource USING btree (survey_response_id);


--
-- Name: data_rec_to_cat; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX data_rec_to_cat ON data_resource USING btree (data_category_id);


--
-- Name: data_rec_to_ttp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX data_rec_to_ttp ON data_resource USING btree (data_template_type_id);


--
-- Name: data_rec_to_type; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX data_rec_to_type ON data_resource USING btree (data_resource_type_id);


--
-- Name: dt_rsrc_txcrts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX dt_rsrc_txcrts ON data_resource USING btree (created_tx_stamp);


--
-- Name: dt_rsrc_txstmp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX dt_rsrc_txstmp ON data_resource USING btree (last_updated_tx_stamp);


--
-- Name: dtrsrc_status; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX dtrsrc_status ON data_resource USING btree (status_id);


--
-- Name: data_resource data_rec_cb_ulgn; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY data_resource
    ADD CONSTRAINT data_rec_cb_ulgn FOREIGN KEY (created_by_user_login) REFERENCES user_login(user_login_id);


--
-- Name: data_resource data_rec_chst; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY data_resource
    ADD CONSTRAINT data_rec_chst FOREIGN KEY (character_set_id) REFERENCES character_set(character_set_id);


--
-- Name: data_resource data_rec_dtsrc; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY data_resource
    ADD CONSTRAINT data_rec_dtsrc FOREIGN KEY (data_source_id) REFERENCES data_source(data_source_id);


--
-- Name: data_resource data_rec_lmb_ulgn; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY data_resource
    ADD CONSTRAINT data_rec_lmb_ulgn FOREIGN KEY (last_modified_by_user_login) REFERENCES user_login(user_login_id);


--
-- Name: data_resource data_rec_survey; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY data_resource
    ADD CONSTRAINT data_rec_survey FOREIGN KEY (survey_id) REFERENCES survey(survey_id);


--
-- Name: data_resource data_rec_svrsp; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY data_resource
    ADD CONSTRAINT data_rec_svrsp FOREIGN KEY (survey_response_id) REFERENCES survey_response(survey_response_id);


--
-- Name: data_resource data_rec_to_cat; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY data_resource
    ADD CONSTRAINT data_rec_to_cat FOREIGN KEY (data_category_id) REFERENCES data_category(data_category_id);


--
-- Name: data_resource data_rec_to_ttp; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY data_resource
    ADD CONSTRAINT data_rec_to_ttp FOREIGN KEY (data_template_type_id) REFERENCES data_template_type(data_template_type_id);


--
-- Name: data_resource data_rec_to_type; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY data_resource
    ADD CONSTRAINT data_rec_to_type FOREIGN KEY (data_resource_type_id) REFERENCES data_resource_type(data_resource_type_id);


--
-- Name: data_resource dtrsrc_status; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY data_resource
    ADD CONSTRAINT dtrsrc_status FOREIGN KEY (status_id) REFERENCES status_item(status_id);


--
-- PostgreSQL database dump complete
--

