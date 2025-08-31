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
-- Name: data_resource_purpose; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE data_resource_purpose (
    data_resource_id character varying(20) NOT NULL,
    content_purpose_type_id character varying(20) NOT NULL,
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.data_resource_purpose OWNER TO ofbiz;

--
-- Name: data_resource_purpose pk_data_resource_purpose; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY data_resource_purpose
    ADD CONSTRAINT pk_data_resource_purpose PRIMARY KEY (data_resource_id, content_purpose_type_id);


--
-- Name: data_rec_prp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX data_rec_prp ON data_resource_purpose USING btree (data_resource_id);


--
-- Name: data_rec_prp_type; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX data_rec_prp_type ON data_resource_purpose USING btree (content_purpose_type_id);


--
-- Name: dt_rsrc_prs_txcrts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX dt_rsrc_prs_txcrts ON data_resource_purpose USING btree (created_tx_stamp);


--
-- Name: dt_rsrc_prs_txstmp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX dt_rsrc_prs_txstmp ON data_resource_purpose USING btree (last_updated_tx_stamp);


--
-- Name: data_resource_purpose data_rec_prp; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY data_resource_purpose
    ADD CONSTRAINT data_rec_prp FOREIGN KEY (data_resource_id) REFERENCES data_resource(data_resource_id);


--
-- Name: data_resource_purpose data_rec_prp_type; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY data_resource_purpose
    ADD CONSTRAINT data_rec_prp_type FOREIGN KEY (content_purpose_type_id) REFERENCES content_purpose_type(content_purpose_type_id);


--
-- PostgreSQL database dump complete
--

