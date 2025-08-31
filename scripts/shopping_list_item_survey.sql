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
-- Name: shopping_list_item_survey; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE shopping_list_item_survey (
    shopping_list_id character varying(20) NOT NULL,
    shopping_list_item_seq_id character varying(20) NOT NULL,
    survey_response_id character varying(20) NOT NULL,
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.shopping_list_item_survey OWNER TO ofbiz;

--
-- Name: shopping_list_item_survey pk_shopping_list_item_survey; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY shopping_list_item_survey
    ADD CONSTRAINT pk_shopping_list_item_survey PRIMARY KEY (shopping_list_id, shopping_list_item_seq_id, survey_response_id);


--
-- Name: shg_lst_itm_srv_tp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX shg_lst_itm_srv_tp ON shopping_list_item_survey USING btree (last_updated_tx_stamp);


--
-- Name: shg_lst_itm_srv_ts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX shg_lst_itm_srv_ts ON shopping_list_item_survey USING btree (created_tx_stamp);


--
-- Name: shlist_itsur_item; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX shlist_itsur_item ON shopping_list_item_survey USING btree (shopping_list_id, shopping_list_item_seq_id);


--
-- Name: shlist_itsur_list; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX shlist_itsur_list ON shopping_list_item_survey USING btree (shopping_list_id);


--
-- Name: shlist_itsur_resp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX shlist_itsur_resp ON shopping_list_item_survey USING btree (survey_response_id);


--
-- Name: shopping_list_item_survey shlist_itsur_item; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY shopping_list_item_survey
    ADD CONSTRAINT shlist_itsur_item FOREIGN KEY (shopping_list_id, shopping_list_item_seq_id) REFERENCES shopping_list_item(shopping_list_id, shopping_list_item_seq_id);


--
-- Name: shopping_list_item_survey shlist_itsur_list; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY shopping_list_item_survey
    ADD CONSTRAINT shlist_itsur_list FOREIGN KEY (shopping_list_id) REFERENCES shopping_list(shopping_list_id);


--
-- Name: shopping_list_item_survey shlist_itsur_resp; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY shopping_list_item_survey
    ADD CONSTRAINT shlist_itsur_resp FOREIGN KEY (survey_response_id) REFERENCES survey_response(survey_response_id);


--
-- PostgreSQL database dump complete
--

