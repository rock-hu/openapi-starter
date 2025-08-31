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
-- Name: data_resource_role; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE data_resource_role (
    data_resource_id character varying(20) NOT NULL,
    party_id character varying(20) NOT NULL,
    role_type_id character varying(20) NOT NULL,
    from_date timestamp with time zone NOT NULL,
    thru_date timestamp with time zone,
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.data_resource_role OWNER TO ofbiz;

--
-- Name: data_resource_role pk_data_resource_role; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY data_resource_role
    ADD CONSTRAINT pk_data_resource_role PRIMARY KEY (data_resource_id, party_id, role_type_id, from_date);


--
-- Name: datarecrl_datrec; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX datarecrl_datrec ON data_resource_role USING btree (data_resource_id);


--
-- Name: datarecrl_ptrl; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX datarecrl_ptrl ON data_resource_role USING btree (party_id, role_type_id);


--
-- Name: dt_rsrc_rl_txcrts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX dt_rsrc_rl_txcrts ON data_resource_role USING btree (created_tx_stamp);


--
-- Name: dt_rsrc_rl_txstmp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX dt_rsrc_rl_txstmp ON data_resource_role USING btree (last_updated_tx_stamp);


--
-- Name: data_resource_role datarecrl_datrec; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY data_resource_role
    ADD CONSTRAINT datarecrl_datrec FOREIGN KEY (data_resource_id) REFERENCES data_resource(data_resource_id);


--
-- Name: data_resource_role datarecrl_ptrl; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY data_resource_role
    ADD CONSTRAINT datarecrl_ptrl FOREIGN KEY (party_id, role_type_id) REFERENCES party_role(party_id, role_type_id);


--
-- PostgreSQL database dump complete
--

